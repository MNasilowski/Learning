#include <stdio.h>
#include <math.h>
#include <stdlib.h>

#define N 2                     
#define dist 0.01                // krok czasowy
#define MAX 30.0                // Max zakres rozwiazań
#define PI 3.14


 
FILE *output;                   // Plik wyjściowy funkcja y(x)
FILE *output2;

void runge4(double x, double y[], double step); 
double f(double x, double y[], int i);          

// FUNKCJA MAIN()
main()
{
double t, y[N],fun[3000][2],funprim[3000][2],x0,P[3000][2],ro[3000][2],Ma[3000][2],T[3000][2],fp,Tc;
double ROc,Pc,alfa,r;
int j;
double G=6.674*pow(10.,-8.);
double M=1.989*pow(10.,33.); // MASA CGS
double R=6.96*pow(10.,10.); // Promień CGS
double n=3.; // wykładnik w równaniu LE (double?)
double mi=1; //waga molekularna
double mH=1.67e-24; //masa protonu(wodoru)
double k=1.38e-16; //stała Boltzmana
 
fun[3000][2]=0;
funprim[3000][2]=0;
ro[3000][2]=0;
P[3000][2]=0;
Ma[3000][2]=0;
T[3000][2]=0;
output=fopen("osc.dat", "w");                  //nazwa pliku zewnętrznego
output2=fopen("osc2.dat","w");

//warunki brzegowe
y[0]=1.0;                                       
y[1]=0.0;                                       
fprintf(output, "0\t %f\n", y[0]);
exit;

//parametr alfa

//alfa=pow(4*Pc,0.5)/(2.*sqrt(PI*G)*ROc);

	for (j=1; j*dist<=MAX ;j++)                     //pętla
	{
   	t=j*dist;
        runge4(t, y, dist);
        fun[j][1]=y[0];
	fun[j][2]=t;
	funprim[j][1]=y[1];
	funprim[j][2]=t;

        fprintf(output, "%f\t %f\t %f\n", t, fun[j][1], funprim[j][1]);

	if(fun[j][1]<0.0 && fun[j-1][1]>0.0){ x0=t; fp=y[1]; }
	}
t=1;
fclose(output);

//wyznaczamy szukane wartości
//znając R oraz x0 wyznaczam parametr alfa

alfa=R/x0;
ROc=M/(-4.*PI*pow(alfa,3.)*pow(x0,2.)*fp);
Pc=(4.*PI*G*pow(ROc,2.)*pow(alfa,2.))/(n+1);
Tc=Pc*mi*mH/(ROc*k);

	for (j=0; j*dist<=MAX ;j++)                     //pętla
	{
   	t=j*dist;
	r=alfa*t;
        P[j][1]=Pc*pow(fun[j][1],4.);
	P[j][2]=r;

	ro[j][1]=ROc*pow(fun[j][1],3.);
	ro[j][2]=r;

	T[j][1]=P[j][1]*mi*mH/(ro[j][1]*k);
	T[j][2]=r;

	Ma[j][1]=-4.*PI*ROc*pow(alfa,3.)*pow(t,2.)*funprim[j][1];
	Ma[j][2]=r;
        fprintf(output2, "%f\t %f\t %f\t %f\t %f\n", r, P[j][1], ro[j][1], Ma[j][1],T[j][1]);
	}

//WYPLUWAMY

//printf("Ksi 0 - %f\n ",x0);
//printf("fprim!!!!!!!! - %f\n",fp);

printf("Masa gwiazdy - %f *10^33.\t\t dane literaturowe 1.989*10^33. [g]\n",M/pow(10.,33.));
printf("Promień gwiazdy - %f *10^10\t\t dane literaturowe 6.96*10^10 [cm]\n",R/pow(10.,10.));
printf("Gęstość centralna - %f\t\t   dane literaturowe 140 [g/cm^3]\n",ROc);
printf("Cieśnienie centralne - %f *10^17\t\t dane literaturowe 10^17 [dyN/cm^2]\n",Pc/pow(10.,17.));
printf("Temperatura Centralna - %f *10^7\t\t dane literaturowe 1.36*10^7 [K]\n",Tc/pow(10.,7.));


}

// RUNGE!!!!!!!!!!!!!!!!!!!!
void runge4(double x, double y[], double step)
{
double h=step/2.0,                      
        t1[N], t2[N], t3[N],            
        k1[N], k2[N], k3[N],k4[N];      
int i;
 
for (i=0;i<N;i++) t1[i]=y[i]+0.5*(k1[i]=step*f(x, y, i));
for (i=0;i<N;i++) t2[i]=y[i]+0.5*(k2[i]=step*f(x+h, t1, i));
for (i=0;i<N;i++) t3[i]=y[i]+    (k3[i]=step*f(x+h, t2, i));
for (i=0;i<N;i++) k4[i]=                step*f(x+step, t3, i);
for (i=0;i<N;i++) y[i]+=(k1[i]+2*k2[i]+2*k3[i]+k4[i])/6.0;
}

/*
//WPROWADZAM Równanie LE
double  f(double x, double y[], int i)
{
if (i==0) return(y[1]);             // dy/dx=u
if (i==1) return((-2./x)*y[1]-pow(y[0],3.)); // du/dx=-2/x*u-y^n
}
*/
//WPROWADZAM Równanie LE
double  f(double x, double y[], int i)
{
if (i==0) return(y[1]);                      // dy/dx=u
if (i==1) return((-2./x)*y[1]-pow(y[0],3.)); // du/dx=-2/x*u-y^n
}

