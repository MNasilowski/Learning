#include<stdio.h>
#include<math.h>
double e = 2.71828182845904;
int main()
{
    double eps, x2,x1;
    int i = 0;
    x2 = 1;
    printf("podaj dokladnosc obliczenia sqrt(e)\n");
    scanf("%lf",&eps);
                  
    
    do
    {
           x1 = x2;
           x2 = 0.5*(x1 + e/x1);
           if(i>1000)
                     {
                                 printf("nie udalo sie uzyskac zadanej dokladnosci");
                                 printf("najlepsze przyblizenie wynosi %lf",x2);
                                 return 0;            
                     }
           i++;
    }
    while(((x2 - x1)>eps)||((x2 - x1)<-eps));
    printf("pierwiastek z e wynosi %lf",x2);
    return 1;
}
