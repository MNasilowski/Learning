#include<stdio.h>
#include<stdlib.h>
#include<math.h>
//*********************Read Me************************************************
//Marcin Nasilowski
//Program calkujacy zadane funkcje metodą Monte Carlo
//argumenty wywolania
//1 - poczatek przedzialu
//2 - koniec przedzialu
//3 - ilosc strzalow
//*****************************************************************************
double f(double x) //funkcja
{
	return -3*x*x + 2;
}
double f1(double a, double b) //calka funkcji
{
	return -b*b*b +2*b + a*a*a -2*a;
}
//*****************************************************************************
double calka(double a, double b, double z)
{
	double x,y,suma;
	double fa =f(a),fb=f(b),pom = 0;
	int i;
	suma = 0;
	srand(time());
	if(fa<fb)
	{
		for(i = 0;i<z;i++)
		{
			x = a + (b-a)*(rand()%10000)*1.0/10000;
			y = f(a) + (f(b) - f(a))*(rand()%10000)*1.0/10000;
			if((y<f(x))&&(y>0)){suma++;}
			if((y>f(x))&&(y<0)){suma--;}
		}
		if((fa*fb)>0){if(fa>0) pom = fa*(b-a);else pom = fb*(b-a);}
		return suma/z*(b-a)*(f(b)-f(a)) + pom;
	}
	else
	{
		for(i = 0;i<z;i++)
		{
			x = a + (b-a)*(rand()%10000)*1.0/10000;
			y = f(b) + (f(a) - f(b))*(rand()%10000)*1.0/10000;
			if((y<f(x))&&(y>0)){suma++;}
			if((y>f(x))&&(y<0)){suma--;}
		}
		if((fa*fb)>0){if(fa<0) pom = fa*(b-a);else pom = fb*(b-a);}
		return suma/z*(b-a)*(f(a)-f(b))+ pom;
	}
}
//******************************************************************************
int main(int argc,char *argv[])
{
double a,b,z,pomoc = 1,wynik1,wynik2;
if(sscanf(argv[1],("%lf"),&a)!=1){printf("bledny typ argumentu 1 \n");return 0;};
if(sscanf(argv[2],("%lf"),&b)!=1){printf("bledny typ argumentu 2 \n");return 0;};
if(sscanf(argv[3],("%lf"),&z)!=1){printf("bledny typ argumentu 3 \n");return 0;};
if(a>b){pomoc = a;a=b;b=pomoc;pomoc = -1;}
wynik1 = calka(a,b,z)*pomoc;
wynik2 = f1(a,b); 
printf("Calka zadanej funkcji wynosi %lf\n",wynik1);
printf("jej blad wzgledny jest rowny %1.5lf\n",(wynik1 - wynik2)/wynik2);
printf("Zwiekszajac liczbe krokow 10 krotnie \n");
z*=10;
wynik1 = calka(a,b,z)*pomoc;
printf("blad wzgledny wynosi %1.5lf\n",(wynik1 - wynik2)/wynik2);
printf("Jeszcze raz zwiekszajac 10 krotnie ilosc rzutow\n");
z*=10;
printf("sghadgjas");
wynik1 = calka(a,b,z)*pomoc;
printf("blad wzgledny wynosi %1.5lf\n",(wynik1 - wynik2)/wynik2);
getchar();
}
