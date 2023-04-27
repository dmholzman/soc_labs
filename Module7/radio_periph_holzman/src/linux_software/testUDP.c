// Dirk Holzman
// 525.742 - Linux SDR with Ethernet Milestone 1
// April 12, 2023

// Program that accepts two inputs (IP address and number of packets) and sends the designated number of packets to the given IP address with UDP protocol.
// Packets are full of test data for verification of transfer.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

#define DEST_PORT 25344
#define FRAME_SIZE 1026

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Incorrect input arguments. Needs: %s <ip address> <number of packets>\n", argv[0]);
        exit(1);
    }

    char *ip_address = argv[1];
    int num_packets = atoi(argv[2]);

    int sockfd;
    struct sockaddr_in servaddr;

    // create a UDP socket
    sockfd = socket(AF_INET, SOCK_DGRAM, 0);

    // set up destination address and port
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(DEST_PORT);
    if (inet_aton(ip_address, &servaddr.sin_addr) == 0) {
        printf("Invalid IP address\n");
        exit(1);
    }

    // send UDP packets
    for (int i = 0; i < num_packets; i++) {
        char packet[FRAME_SIZE];

        // set the first two bytes of the packet to the counter value
        uint16_t counter = i;
        memcpy(packet, &counter, sizeof(counter));

        // set the remaining bytes of the packet to the data values
        for (int j = 2; j < FRAME_SIZE; j += 4) {
            int16_t i_value = rand() % 32768; // set I value to rand value (or LUT with sine)
            int16_t q_value = 0; // set Q value to 0
            memcpy(packet + j, &i_value, sizeof(i_value));
            memcpy(packet + j + 2, &q_value, sizeof(q_value));
        }

        // send the packet
        if (sendto(sockfd, packet, FRAME_SIZE, 0, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
            printf("Error sending packet %d\n", i);
            exit(1);
        }
		
		// delay between packets
		sleep(0.1); // sleep for 100 ms
    }

    close(sockfd);
    return 0;
}
