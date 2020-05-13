//Marcin Nasilowsi
//Program wykonujacy 3 prace domowa z Astrofizyki I 
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#define KB (1.3806488e-23)
#define h (6.626069e-34)
#define c (299792458)
#define b (2.89e-3)
#define o (10000)
#define PI  (3.141592653)
#define EPS 3.0e-11
#define R  (6.96e8)
#define ja 150e9





//************Funkcja Gauleg potrzebna do calkowania****************************
void gauleg(float x1, float x2, float x[], float w[], int n)
{
	int m,j,i;
	double z1,z,xm,xl,pp,p3,p2,p1;

	m=(n+1)/2;
	xm=0.5*(x2+x1);
	xl=0.5*(x2-x1);
	for (i=1;i<=m;i++) {
		z=cos(3.141592654*(i-0.25)/(n+0.5));
		do {
			p1=1.0;
			p2=0.0;
			for (j=1;j<=n;j++) {
				p3=p2;
				p2=p1;
				p1=((2.0*j-1.0)*z*p2-(j-1.0)*p3)/j;
			}
			pp=n*(z*p1-p2)/(z*z-1.0);
			z1=z;
			z=z1-p1/pp;
		} while (fabs(z-z1) > EPS);
		x[i]=xm-xl*z;
		x[n+1-i]=xm+xl*z;
		w[i]=2.0*xl/((1.0-z*z)*pp*pp);
		w[n+1-i]=w[i];
	}
}
//************Funkcja planka to ja bedziemy calkowac****************************
double planck(float f, float T)
{
double wynik;
wynik = 2*3.141592654*h*f*f*f;
wynik = wynik/c;
wynik = wynik/c;
wynik = wynik /(exp(h*f/(KB*T)) - 1);
return wynik;
}
//******************************************************************************






//******************************************************************************
//                          PROGRAM GLOWNY
//******************************************************************************
int main (int l, char *arg[])
{ 
  //int n = 1000;
  //float  b =  2.89e-3;
  int i;      //zmienna obslugujaca petle
  float w[o]; //tabela podawana do funkcji wyzej
  float x[o]; //tabela
  float f1;   //poczatek przedzialu calkowania
  float f2;   //koniec przedzilau calkowania
  float suma; //Jak sama nazwa fskazuje zmienna przechowujaca sume
  float J;    //"Jasnosc" bolometryczna
  float Jwidz;//Czesc w zakresie widzialnym;
  float Jl;   //Czesc w zakresie liscia;
  float T;   //Temperatura gwiazdy
  float lmax = 0.0000005;// Dlugos odpowiadajaca maksimum promieniowania
  float S;   //Stala stefana boltzmana
  float W;   //stala sloneczna dla liscia
  printf("Troche plotek o Sloncu \n");
 //************Nadawanie wartosci poczatkowych
  suma = 0;
  for(i = 0;i<o;i++)
    {
      w[i] = 0;
      x[i] = 0;
    }
 //***********Obliczanie temperatury bolometrycznej
	T = b/lmax;
	printf("Temperatura Bolometryczna %f [K] \n",T);
 //***********Wyznaczanie jasnosci bolometrycznej
 //***********Przecalkujmy planka po "wszystkich" czestosciach
  gauleg(0,1e20,x,w,o-1);
  for(i = 1;i<o;i++)
    {
      suma  = suma + w[i]*planck(x[i],T);
    }
  J = suma;
  suma = 0;
 //***********Wyznaczmy stala stefana boltzmana
  S = J/pow(T,4);
  printf("Jasnosc Bolometryczna %E [W]\n",4*PI*R*R*J);
  printf("Stala stef-boltz %E [W/(m^2 K^4)] \n",S); 
//************Jasnoœæ w zakresie widzialnym
  suma = 0;
  for(i = 0;i<o;i++)
    {
      w[i] = 0;
      x[i] = 0;
    }
  f2 = c/400e-9;
  f1 = c/750e-9;
  gauleg(f1,f2,x,w,o-1);
  for(i = 1;i<o;i++)
    {
      suma  = suma + w[i]*planck(x[i],T);
    }
  Jwidz = suma;
  printf("Czesc widzialna widma %f \n", Jwidz/J);
//************Jasnoœæ w zakresie liscia
  suma = 0;
  for(i = 0;i<o;i++)
    {
      w[i] = 0;
      x[i] = 0;
    }
  f2 = c/430e-9;
  f1 = c/650e-9;
  gauleg(f1,f2,x,w,o-1);
  for(i = 1;i<o;i++)
    {
      suma  = suma + w[i]*planck(x[i],T);
    }
  Jl = suma;
  W = (R*R)/(ja*ja)*16e-4*Jl; 
  printf("Moc pochlaniana przez lisc %f [W] \n", W);
  return 0;
}
#undef EPS
#undef KB 
#undef h 
#undef c 
#undef b 
#undef n
#undef PI
#undef R
