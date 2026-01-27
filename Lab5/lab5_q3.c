// #include "/courses/compx230-engee230/lab5/lib_lab5/.h"
#include "lib_lab5.h"

void count(int start, int end) {
    int i = 0;

    if (start >= 10000 || start < 0 || end >= 10000 || end < 0)
    {
        return;
    }
    else if (start == end)
    {
        writessd(start); 
    }
    else if (start < end)
    {
        // count up
        for (i = start; i <= end; i++)
        {
            writessd(i);
            delay();
        }
    }
    else 
    {
        // count down
        for (i = start; i >= end; i--)
        {
            writessd(i);
            delay();
        }
    }
}
