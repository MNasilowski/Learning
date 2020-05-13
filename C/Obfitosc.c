//Marcin Nasilowski
//Program licz¹cy obfitoœæ wêgla i tlenu
#include<stdio.h>
#include<math.h>
//****dx12/dx4 = f = dy/dx
double f(double x, double y, double q)
{
return (9.0*x*x - 12.0*q*y)/(-9.0*x*x - 4*q*y);       
}
//****dx16/dx4 = g = dy/dx
double g(double x, double y, double q)
{
return ( 16.0*q*y)/(-9.0*x*x - 4*q*y);
}

int main()
{
double k1,k2,k3,k4;          //wspolczynniki w metodzie R-K 4R
double h = 0.0001;           //skok 
double q = 10;               //paramtr
double x = 1;                // X4 pocz¹tkowo 100%
double y = 0;                // X12 pocz¹tkowo brak
double k0 = 0;               //zmienna pomocnicza
double y16 = 0;              //X16 pocz¹tkowo brak
//for(q=0.1;q<10;q = q + 0.1)
//{
//Odpalamy algorytm rungego kutty                   
for(x = 1;x >= 0;x=x-h)
{
 k1 = f(x,y,q);
 k2 = f(x + 0.5*h,y + 0.5*h*k1,q);
 k3 = f(x + 0.5*h,y + 0.5*h*k2,q);
 k4 = f(x + h,y + h*k3,q);
 k0 = (1.0/6.0) * h*(k1 + 2*k2 + 2*k3 + k4);
 k1 = g(x,y,q);
 k2 = g(x + 0.5*h,y + 0.5*h*k1,q);
 k3 = g(x + 0.5*h,y + 0.5*h*k2,q);
 k4 = g(x + h,y + h*k3,q);
 y16 = y16 - (1.0/6.0) * h*(k1 + 2*k2 + 2*k3 + k4);
 y = y-k0;
 printf("%f \t %f \t %f \n", x , y,y16);
//}
//printf("%f \t %f \n",q,y16/y);
}
return 0;
}
