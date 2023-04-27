#include <stdio.h>
#include <sys/mman.h> 
#include <fcntl.h> 
#include <unistd.h>

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

// the below code uses a device called /dev/mem to get a pointer to a physical
// address.  We will use this pointer to read/write the custom peripheral
volatile unsigned int * get_a_pointer(unsigned int phys_addr)
{

	int mem_fd = open("/dev/mem", O_RDWR | O_SYNC); 
	void *map_base = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phys_addr); 
	volatile unsigned int *radio_base = (volatile unsigned int *)map_base; 
	return (radio_base);
}

void radioTuner_tuneRadio(volatile unsigned int *ptrToRadio, float tune_frequency)
{
	float pinc = (-1.0*tune_frequency)*(float)(1<<27)/125.0e6;
	*(ptrToRadio+RADIO_TUNER_TUNER_PINC_OFFSET)=(int)pinc;
}

void radioTuner_setAdcFreq(volatile unsigned int* ptrToRadio, float freq)
{
	float pinc = freq*(float)(1<<27)/125.0e6;
	*(ptrToRadio+RADIO_TUNER_FAKE_ADC_PINC_OFFSET) = (int)pinc;
}

// Function to read a specified number of samples from the FIFO
void read_samples(volatile unsigned int* ptrToFifo, int numSamples) 
{
int count = 1;
int readWord, readWC;

while (count < numSamples) {
	readWC = *(ptrToFifo+FIFO_WORD_COUNT_OFFSET);
	if (readWC > 0) {
		readWord = *(ptrToFifo+FIFO_DATA_OFFSET);
		count++;
	}
}
return;
}

int main()
{
	// get pointers to radio and fifo peripherals
    volatile unsigned int *my_periph = get_a_pointer(RADIO_PERIPH_ADDRESS);	
	volatile unsigned int *my_fifo = get_a_pointer(FIFO_PERIPH_ADDRESS);	
	
    printf("\r\n\r\n\r\nLinux SDR Milestone 2 - Dirk Holzman - FIFO Test\n\r");
    *(my_periph+RADIO_TUNER_CONTROL_REG_OFFSET) = 0; // make sure radio isn't in reset
    printf("Tuning Radio to 30MHz\n\r");
    radioTuner_tuneRadio(my_periph,30e6);
    printf("Playing tone at near 30MHz\r\n");
	radioTuner_setAdcFreq(my_periph,30.001e6);
	
	printf("Reading 10 seconds worth of data…\n");
	read_samples(my_fifo, NUM_SAMPLES);
	printf("Finished! Printing top 5 words of FIFO: \n");
	printf("   0x%x \n",*(my_fifo+FIFO_DATA_OFFSET));
	printf("   0x%x \n",*(my_fifo+FIFO_DATA_OFFSET));
	printf("   0x%x \n",*(my_fifo+FIFO_DATA_OFFSET));
	printf("   0x%x \n",*(my_fifo+FIFO_DATA_OFFSET));
	printf("   0x%x \n",*(my_fifo+FIFO_DATA_OFFSET));
	printf("Exiting!\n");
	
    return 0;
}