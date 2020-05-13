//Marcin Nasilowski
//Program liczacy silnie
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
//*****************************************************************************
//dziala do n = 1754
long double sil1(int n)
{
int i;
long double wynik = 1;
	for (i=1;i<=n;i++)
	{
	wynik *=i;
	}
return wynik;
}
//*****************************************************************************
//dziala do n = 170
double sil2(int n)
{
int i;
double wynik = 1;
	for (i=1;i<=n;i++)
	{
	wynik *=i;
	}
return wynik;
}
//*****************************************************************************
//dziala do n = 12
int sil3(int n)
{
int i;
int wynik = 1;
	for (i=1;i<=n;i++)
	{
	wynik *=i;
	}
return wynik;
}
//*****************************************************************************
//dziala dla n < 10^8 dla wiekrzych n nie sprawdzalem bo jest to zbyt dlugotrwale(powyrzej kilku sekund)
double lsil(int n)
{
int i;
double wynik = 0;
	for (i=1;i<=n;i++)
	{
	wynik =wynik +  log10(i);
	}
return wynik;
}
//*****************************************************************************
int main(int l, char *arg[])
{
int i;
int n = atoi(arg[1]);
int k = 0;
double wyn;
//liczenie silni przy pomocy logarytmow wynik w postaci x * 10^k
wyn = lsil(n);
k = (int)(wyn);
wyn = pow(10,(wyn - k));
printf("silnia liczona przez logarytm: \n");
printf("%lf 10^%d \n",wyn,k);
//liczenie silni "normalnie"
printf("silnia typu long double\n");
printf("%Lf \n",sil1(n));
printf("silnia typu double: \n");
printf("%lf \n",sil2(n));
printf("silnia typu int: \n");
printf("%d \n",sil3(n));
return 1;
//*****************************************************************************
}

