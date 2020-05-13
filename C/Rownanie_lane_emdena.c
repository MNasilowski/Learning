//Metoda Runge-Kutta-Nystrom
//Marcin Nasilowski
//Rownanie lane emdena dla n = 3
//Oczywisce mozna przedefiniowac n na dowolna stala
#include<stdio.h>
#include<math.h>
#define n 3
double f(double y, double x, double xp)
{
return -2.0*xp/y - pow(x,n);
}
int main()
{
    double t[3][1000];//tab[y][z][z']
    double k1, k2, k3, k4, h;
    int i;
    
//Metoda RKN
h = 0.01;
t[0][0] = 0; //y czyli argument
t[1][0] = 1; //x czyli wartosc funkcji
t[2][0] = 0; //xp czyli pochodna funcji
k1 = 0;
k2 = 0;
k3 = 0;
k4 = 0;
//Algorytm Runge-Kutta-Nystrom
//poniewa¿ mamy nieoznaczonoœæ dla y = 0 pierwsze k1 wyznaczylem analitycznie
i = 0;
      printf("%f %f %f \n",t[0][i],t[1][i],t[2][i]);
      k1 = 0,015;
      k2 = 0.5*h*f(t[0][i] + 0.5*h,t[1][i] + 0.5*h*(t[2][i] + 0.5*k1),t[2][i] +k1);
      k3 = 0.5*h*f(t[0][i] + 0.5*h,t[1][i] + 0.5*h*(t[2][i] + 0.5*k1),t[2][i] +k2);
      k4 = 0.5*h*f(t[0][i] + h,t[1][i] + h*(t[2][i] + k3),t[2][i] +2*k2);
      t[1][i + 1] = t[1][i] + h*(t[2][i] + (k1 +k2 + k3)/3.0);
      t[2][i + 1] = t[2][i] +(k1 +2*k2 + 2*k3 +k4)/3.0;
      t[0][i + 1] = t[0][i] + h;
for(i = 1; i < 1000; i++)
{
      printf("%f %f %f \n",t[0][i],t[1][i],t[2][i]);
      k1 = 0.5*h*f(t[0][i],t[1][i],t[2][i]);
      k2 = 0.5*h*f(t[0][i] + 0.5*h,t[1][i] + 0.5*h*(t[2][i] + 0.5*k1),t[2][i] +k1);
      k3 = 0.5*h*f(t[0][i] + 0.5*h,t[1][i] + 0.5*h*(t[2][i] + 0.5*k1),t[2][i] +k2);
      k4 = 0.5*h*f(t[0][i] + h,t[1][i] + h*(t[2][i] + k3),t[2][i] +2*k2);
      t[1][i + 1] = t[1][i] + h*(t[2][i] + (k1 +k2 + k3)/3.0);
      t[2][i + 1] = t[2][i] +(k1 +2*k2 + 2*k3 +k4)/3.0;
      t[0][i + 1] = t[0][i] + h;
}    
//Mamy tabelê x(y)
} 
#undef n
