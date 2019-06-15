#include <stdio.h>

static inline int strncmp1(const char * cs,const char * ct,int count)
{
    register int __res __asm__("ax");
    __asm__("cld\n"
            "1:\tdecl %3\n\t"
            "js 2f\n\t"
            "lodsb\n\t"
            "scasb\n\t"
            "jne 3f\n\t"
            "testb %%al,%%al\n\t"
            "jne 1b\n"
            "2:\txorl %%eax,%%eax\n\t"
            "jmp 4f\n"
            "3:\tmovl $1,%%eax\n\t"
            "jl 4f\n\t"
            "negl %%eax\n"
            "4:"
            //:"=a" (__res):"D" (cs),"S" (ct),"c" (count):"si","di","cx");
            :"=a" (__res):"D" (cs),"S" (ct),"c" (count):);
    return __res;

}

int main(int argc, char *argv[])
{
	if(argc == 3) {
		printf("result = %d\n",strncmp1(argv[1],argv[2],2));
	}
	else
		printf("Please Input 3 Para\n");
	return 0;
}
