#include<stdio.h>
main()
{
      float i,V;
for (i = 0;i<10;i=i+0.01)
{
    V = V + i*i*0.01;
}      
V = V*4*3.14;
printf("%f",V);
scanf("%f",&V);
}
