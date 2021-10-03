/*
 * cross_core.c : created by n7utb 
 *                a test to the bind_cpu function
 * 
 */

#include "micro.h"
#include <math.h>
#include <unistd.h>
#include <sys/mman.h>


/* waste time function to monitor the cpu*/
double waster_time(long n)
{
    double res = 0;
    long i = 0;
    while ( i < n * 200000 )
    {
        i++;
        res += sqrt(i);
    }
    return res;
}
int main(void)
{
    int pid;
    void* m = mmap(NULL, 0x1000, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_SHARED | MAP_ANONYMOUS, -1, 0 );


    size_t time,overhead;
    time = rdtscfence();
    overhead = rdtscfence() - time;          
    time = rdtscfence();
    maccess(m) ;                      
    time = rdtscfence() - time;    
    printf("Start Time access: %ld\n",time - overhead);
    flush(m);



    pid = fork();
    if (pid == 0)   /* child process */
    {
        size_t time,overhead;
        bind_cpu(2);
        time = rdtscfence();
        overhead = rdtscfence() - time;                             
        time = rdtscfence();
        maccess(m) ;                      
        time = rdtscfence() - time;    
        printf("Child Time access: %ld\n",time - overhead);
    }
    else
    {
        size_t time,overhead;
        bind_cpu(1);                 
        time = rdtscfence();
        overhead = rdtscfence() - time;                             
        time = rdtscfence();
        maccess(m) ;                      
        time = rdtscfence() - time;    
        printf("Parent Time access: %ld\n",time - overhead);
    }
    return 0;
}