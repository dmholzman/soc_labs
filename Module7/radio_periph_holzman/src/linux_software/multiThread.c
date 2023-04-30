#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>  
#include <pthread.h>
  
void *myThreadFun(void *vargp)
{
    while(1) {
        sleep(1);
        printf("Printing from Thread \n");
        }
    return NULL;
}
   
int main()
{
    pthread_t thread_id;
    pthread_create(&thread_id, NULL, myThreadFun, NULL);
    while(1) {
        printf("printing from main\n");
        sleep(2);
    }
}
