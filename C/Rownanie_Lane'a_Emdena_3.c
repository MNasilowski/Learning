//Metoda Runge-Kutta-Nystrom
#include<stdio.h>
#include<math.h>
double f(double y, double z)
{
return -(z*z*z)/(y*y);
}
int main()
{
    double t[3][1000];//tab[y][z][z']
    double k1, k2, k3, k4, z, zp, y, h;
    int i;
    
//Metoda RKN
h = 0.01;
t[0][0] = 1;
t[1][0] = 0;
t[2][0] = 0;

for(i = 0; i < 1000; i++)
{
      printf("%f %f %f \n",t[0][i],t[1][i],t[2][i]);
      k1 = 0.5*h*f(t[0][i],t[1][i]);
      k2 = 0.5*h*f(t[0][i] + 0.5*h,t[1][i] + 0.5*h*(t[2][i] + 0.5*k1));
      k3 = k2;
      k4 = 0.5*h*f(t[0][i] + h,t[1][i] + h*(t[2][i] + k3));
      t[2][i + 1] = (k1 + 2*k2 + 2*k3 + k4)/3;
      t[1][i + 1] = t[1][i] + h*(t[2][i] + (k1 +k2 + k3)/3);
      t[0][i + 1] = t[0][i] + h;
}    
} 
