#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h> 
#include <fcntl.h> 
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <termios.h>
#include <pthread.h>

#define RADIO_TUNER_FAKE_ADC_PINC_OFFSET 0
#define RADIO_TUNER_TUNER_PINC_OFFSET 1
#define RADIO_TUNER_CONTROL_REG_OFFSET 2
#define RADIO_TUNER_TIMER_REG_OFFSET 3
#define RADIO_PERIPH_ADDRESS 0x43c00000

#define FIFO_DATA_OFFSET 0
#define FIFO_WORD_COUNT_OFFSET 1
#define FIFO_PERIPH_ADDRESS 0x43c10000

#define CLOCK_RATE_MHZ 125000000
#define NUM_SAMPLES 480000
#define DEST_PORT 25344
#define FRAME_SIZE 1026

// Global Variables
int phase = 0x432; // 1kHz = 1000/0.931 = 1074
int tunePhase = 0;
int curFreq = 30001000;
int curTune = 30000000;
char freqStr[16], tuneFreqStr[16];
char *ip_address;

// Function to get a single character from the user without requiring an end of line character
char getInput()
{
	struct termios old_tio, new_tio;
    char c;

    // Get the terminal attributes
    tcgetattr(STDIN_FILENO, &old_tio);

    // Set the terminal to raw mode
    new_tio = old_tio;
    new_tio.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);

    // Read a single character from user input
    c = getchar();
    // Restore the terminal attributes
    tcsetattr(STDIN_FILENO, TCSANOW, &old_tio);

    return c;
}

// the below code uses a device called /dev/mem to get a pointer to a physical
// address.  We will use this pointer to read/write the custom peripheral
volatile unsigned int * get_a_pointer(unsigned int phys_addr)
{

	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC); 
	void *map_base = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phys_addr); 
	volatile unsigned int *radio_base = (volatile unsigned int *)map_base; 
	return (radio_base);
}

// Function to set DDS into reset (active high, so set 1 for reset)
void reset_dds(volatile unsigned int *ptrToRadio, int val) {
	 *(ptrToRadio+RADIO_TUNER_CONTROL_REG_OFFSET) = val;
	 return;
}

// Function to set radio tune frequency
void radioTuner_tuneRadio(volatile unsigned int *ptrToRadio, float tune_frequency)
{
	curTune = (int)tune_frequency;
	float pinc = (-1.0*tune_frequency)*(float)(1<<27)/125.0e6;
	tunePhase = (int)pinc;
	*(ptrToRadio+RADIO_TUNER_TUNER_PINC_OFFSET)=(int)pinc;
}

// Function to set fake ADC frequency
void radioTuner_setAdcFreq(volatile unsigned int* ptrToRadio, float freq)
{
	curFreq = (int)freq;
	float pinc = freq*(float)(1<<27)/125.0e6;
	phase = (int)pinc;
	*(ptrToRadio+RADIO_TUNER_FAKE_ADC_PINC_OFFSET) = (int)pinc;
}

// Function to play a pre-created tune
void play_tune(volatile unsigned int *ptrToRadio, float base_frequency)
{
	int i;
	float freqs[16] = {1760.0,1567.98,1396.91, 1318.51, 1174.66, 1318.51, 1396.91, 1567.98, 1760.0, 0, 1760.0, 0, 1760.0, 1975.53, 2093.0,0};
	float durations[16] = {1,1,1,1,1,1,1,1,.5,0.0001,.5,0.0001,1,1,2,0.0001};
	for (i=0;i<16;i++)
	{
		radioTuner_setAdcFreq(ptrToRadio,freqs[i]+base_frequency);
		usleep((int)(durations[i]*500000));
	}
}

void *sendPacketsThread(void *vargp)
{
	volatile unsigned int *my_fifo = get_a_pointer(FIFO_PERIPH_ADDRESS);	

	int sockfd;
    struct sockaddr_in servaddr;
	char packet[FRAME_SIZE];
	uint16_t packetNum = 0;
	int count = 1;
	int readWord, readWC, wordCount;

    // create a UDP socket
	// AF_INET is IPv4, SOCK_DGRAM is Datagrams, IPPROTO_UDP is UDP
    if ((sockfd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1) {
        perror("Socket creation failed.");
		exit(1);
    }

    // set up destination address and port
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(DEST_PORT);
    if (inet_aton(ip_address, &servaddr.sin_addr) == 0) {
        printf("Invalid IP address\n");
        exit(1);
    }

    // send UDP packets
    while(1) {
		while (count < 1024) {
			readWC = *(my_fifo+FIFO_WORD_COUNT_OFFSET);
			if (readWC > 0) {
				readWord = *(my_fifo+FIFO_DATA_OFFSET);
				memcpy(packet + count + 2, &readWord, sizeof(readWord));
				count = count + 4;
			}
		}
		
		count = 0;
		packetNum++;
        // set the first two bytes of the packet to the packetNum value
        memcpy(packet, &packetNum, sizeof(packetNum));

        // send the packet
        if (sendto(sockfd, packet, FRAME_SIZE, 0, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
            perror("Error sending packet.");
            exit(1);
        }
    }
}

// Function to print the user menu
void print_menu()
{
    printf("\n\rType 't' to tune radio to a new frequency.\n\r");
    printf("Type 'f' to set the fake ADC to a new frequency.\n\r");
    printf("Type 'U/u' to increase frequency by 1000/100 Hz.\n\r");
    printf("Type 'D/d' to decrease frequency by 1000/100 Hz.\n\r");
	printf("Type 'p' to play a tune.\n\r");
    printf("Type 'r' to reset the DDS phase.\n\r");
	printf("Type 'q' to quit.\n\n\r");
    return;
}

int main(int argc, char *argv[]) 
{
	// Check user included IP as input argument
    if (argc != 2) {
        printf("Incorrect input arguments. Needs: %s <IP address>\n", argv[0]);
        exit(1);
    }
	
	ip_address = argv[1];
	
	// get pointer to radio peripheral
    volatile unsigned int *my_periph = get_a_pointer(RADIO_PERIPH_ADDRESS);	
	
	// setup multi threading, want thread for sending packets to be detached from main thread
	pthread_t thread;
    pthread_attr_t thread_attr	;
    pthread_attr_init(&thread_attr); // initialize attributes for thread
    pthread_attr_setdetachstate(&thread_attr, PTHREAD_CREATE_DETACHED); // set to detached
    pthread_create(&thread, &thread_attr, sendPacketsThread, NULL); // create thread
	
	printf("\r\n\r\n\r\nFull Linux SDR with Ethernet - Dirk Holzman\n\r");
	
	printf("Taking the DDS out of reset...\n\r");
	reset_dds(my_periph, 0);
	
	printf("Setting default radio tune to 30 MHz and fake ADC to 30.001 MHz.\n\r");
	radioTuner_tuneRadio(my_periph, curTune);
	radioTuner_setAdcFreq(my_periph, curFreq);

	// Begin user accessibility
	char keystroke, c;
	
	printf("Thank you for your patience. Welcome to the radio!\n\r");

    while(1) {
		print_menu();
    	keystroke = getInput();

    	// Response based on keystroke
    	if ((keystroke == 'f') || (keystroke == 'F')) { // set frequency, take in an input string in Hz
			printf("Enter ADC frequency (Hz): ");
			scanf("%[^\n]", &freqStr);
			while ((c = getchar()) != '\n' && c != EOF) {}
		
    	    if (atoi(freqStr) < 0 || atoi(freqStr) > 62500000) // valid tunes between 0 and 62.5 MHz
    	    	printf("Invalid signal frequency. Please select a frequency from 0 Hz to 62.5 MHz.\n\r");
    	    else {
    	    	radioTuner_setAdcFreq(my_periph, atoi(freqStr)); 
				printf("ADC frequency is now: %i Hz. Phase is now: 0x%x\n\r", curFreq, phase);
			}
    	}
    	// allow both lowercase and uppercase characters
    	else if ((keystroke == 't') || (keystroke == 'T')) { // set tune frequency, take in an input string in Hz
			printf("Enter tune frequency (Hz): ");
			scanf("%[^\n]", &tuneFreqStr);
			while ((c = getchar()) != '\n' && c != EOF) {}
			
    	    if (atoi(tuneFreqStr) < 0 || atoi(tuneFreqStr) > 62500000) // valid tunes between 0 and 62.5 MHz
    	    	printf("Invalid tune frequency. Please select a frequency from 0 Hz to 62.5 MHz.\n\r");
    	    else {
    	    	radioTuner_tuneRadio(my_periph, atoi(tuneFreqStr));
				printf("Tune frequency is now: %i Hz. Phase is now: 0x%x\n\r", curTune, tunePhase);
			}
    	}
    	else if (keystroke == 'u') { // up 100 Hz
    		radioTuner_setAdcFreq(my_periph, curFreq + 100);
    		printf("Frequency increased by 100 Hz. ADC frequency is now: %i Hz. Phase is now: 0x%x\n\r", curFreq, phase);
			printf("Tune frequency is: %i Hz. Phase is: 0x%x\n\r", curTune, tunePhase);
    	}
    	else if (keystroke == 'U') { // up 1000 Hz
    		radioTuner_setAdcFreq(my_periph, curFreq + 1000);
    		printf("Frequency increased by 1000 Hz. ADC frequency is now: %i Hz. Phase is now: 0x%x\n\r", curFreq, phase);
			printf("Tune frequency is: %i Hz. Phase is: 0x%x\n\r", curTune, tunePhase);
    	}
    	else if ((keystroke == 'd')) { // down 100 Hz
    		radioTuner_setAdcFreq(my_periph, curFreq - 100);
    		printf("Frequency decreased by 100 Hz. ADC frequency is now: %i Hz. Phase is now: 0x%x\n\r", curFreq, phase);
			printf("Tune frequency is: %i Hz. Phase is: 0x%x\n\r", curTune, tunePhase);
    	}
    	else if ((keystroke == 'D')) { // down 1000 Hz
    		radioTuner_setAdcFreq(my_periph, curFreq - 1000);
    		printf("Frequency decreased by 1000 Hz. ADC frequency is now: %i Hz. Phase is now: 0x%x\n\r", curFreq, phase);
			printf("Tune frequency is: %i Hz. Phase is: 0x%x\n\r", curTune, tunePhase);
    	}
		else if ((keystroke == 'p') || (keystroke == 'P')) { // play tune
			printf("Playing tune near current tune frequency.\n\r");
			play_tune(my_periph, curTune);
		}
    	else if ((keystroke == 'r') || (keystroke == 'R')) { // pulse reset line to DAC to set phase (not freq) to 0
    		printf("Pulsing DDS reset signal to reset phase.\n\r");
			reset_dds(my_periph, 1);
			reset_dds(my_periph, 0);
    	}
		else if ((keystroke == 'q') || (keystroke == 'Q')) { // quit program
			printf("Thanks for calling into the radio! Please tune in again.\n\r");
			reset_dds(my_periph, 1);
			break;
		}
    	else {
    		printf("Invalid input. Reprinting menu.\n\n\r");
    	}
    }
	
	// end packet thread
	pthread_attr_destroy(&thread_attr);
	pthread_cancel(thread);

    return 0;
}