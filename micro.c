#include "micro.h"
void bind_cpu(int id)
{
    cpu_set_t mask;
    CPU_ZERO(&mask);                                    /* initialize and clear the set */
    CPU_SET(id, &mask);                                  /* bind CPU id on the set */
    if (sched_setaffinity(0, sizeof(mask), &mask) < 0)
    {
        perror("sched_setaffinity");
    }
    return;
}


