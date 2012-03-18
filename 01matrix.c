#include<stdio.h>
#include<stdlib.h>

int main(int argc, char** argv)
{
    int c;
    long i,m,n,area;
    if (argc < 2) return 1;
    i=0;
    m=atoi(argv[1]);
    n=atoi(argv[2]);
    area=m*n;
    printf("[[");
    while ((c=getchar())!=-1)
    {
        printf("%d", c & 1);
	if (i == area-1)
        {
            printf("]]");
            return 0;
        }
        else if ((i+1) % n)
	    printf(",");
	else printf("],[");
	i++;
        fflush(stdout);
    }
    return 1;
}
