/*
 * main.c : created by n7utb, last edit at 2021/10/3 17:18
 *          
 */

#include "micro.h"
#include <unistd.h>
#include <sys/mman.h>
int main(void)
{
    int pid;
    void* m = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_SHARED, -1, 0 );
    pid = fork();
    if (pid == 0)   /* child process */
    {
        bind_cpu(2);
    }
    else
    {
        bind_cpu(1);
    }
    return 0;
}