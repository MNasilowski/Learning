#include<stdio.h>
#include<math.h>
//*****READ ME******************************************************************
//Marcin Nasilowski
//Dopasowanie wielomianu metoda Nevile-a
//argumenty
//		1 nazwa pliku z danymi
//		2 poczatek przedzialu
//		3 koniec przedzialu
//		4 plik wynikowy albo -m dla wyswietlania na monitor
//		5 skok argumentu
//
//***przykladowe wywolanie
//
//nazwaprogramu dane.txt -3.14 3.14 -m 0.1 
//
//Program policzy wartosci wielomianu w przedziale od -3.14 do 3.14 
//dopasowanego do danych z pliku dane.txt 
//wartosci zostana policzone co 0.1
//wyniki zostan± wy¶wietlone na monitorze
//
//***Format wynikow
//
//kolumna 1 argument funkcji
//        2 wartosc dopasowanego wielomianu
//	  3 wartosc funkcji sin
//*****************************************************************************


//*****************************************************************************
//funkcja znajdujaca wartosc wielomianu interpolacyjnego 
//gdzie Tab tablica 2D zawierajaca punkty
//      dim ilosc punktow
//      dim2 wymiar Tab
//      argument wielomianu
double nevile(double *Tab,int dim,double x,int dim2)
{
       double W[dim][dim]; //warzna tabela
       int i,j;            //zmienne do obs³ugi pêtli

//*****Uzupelnianie warznej tablicy danymi podanymi z glownego programu********* 
       for(i=0;i<dim;i++)
       {
                 W[0][i] = *(Tab + i);
                 W[1][i] = *(Tab + dim2 + i); 
       }
//*****Stosowanie algorytmu Neville-a*******************************************
       for(i = 2;i<dim+1;++i)
       {
             for(j = 0;j<dim - i + 1;j++)
             {
                   W[i][j] = ((x - W[0][j+i-1])*W[i-1][j] - (x - W[0][j])*W[i-1][j+1])/(-W[0][j+i-1] + W[0][j] );    
             } 
       }
       return W[dim ][0];     
}
//******************************************************************************


//*****Program glowny***********************************************************
int main(int n,char *arg[])
{
    int dim2 = 80;       //zmienna zawierajaca maksymalna ilosc punktow
    int dim = 0;         //prawdziwa ilosc punktow
    double Tab[2][dim2]; //tabela z wczytanymi punktami
    double wynik;        //wynik:)
    double pocz ;        //poczatek przedzialu w ktorym liczona bedzie wartosc wielomianu interpolacyjnego
    double kon ;         //koniec przedzialu
    double skok;        //jak gesto bedzie liczona wartosc wielomianu interpolacyjnego
    double x;            //argument
    FILE *fp; 
    int i,j;             //zmienne obslugujace petle
    
//*****Wczytywanie danych*******************************************************
//*****Z argumentow wywolania
if(sscanf(arg[2],("%lf"),&pocz)!=1){printf("bledny typ argumentu 2 \n");return 0;};
if(sscanf(arg[3],("%lf"),&kon)!=1){printf("bledny typ argumentu 3 \n");return 0;};
if(sscanf(arg[5],("%lf"),&skok)!=1){printf("bledny typ argumentu 5 \n");return 0;};
    if((fp = fopen(arg[1],"r")) == NULL)
     {
       	printf("nie udalo sie otworzyc pliku \n");
       	printf("program zostanie zakonczony \n");
        return -1;
     }
     while(fscanf(fp,"%lf %lf",&Tab[0][dim],&Tab[1][dim])==2){dim++;}
     fclose(fp);
//******************************************************************************


//*****Zapisywanie danych*******************************************************
	x = pocz;
	if((arg[4][0]=='-')&&(arg[4][1]=='m'))
	{
		while(x < 3)
    		{
    			wynik = nevile(*Tab,dim,x,dim2);
    			printf("%lf \t %lf \t %lf \n",x,wynik,sin(x));
    			x += skok;
    		}
	}
	else
	{
    		fp = fopen(arg[4],"w");
    		while(x < 3)
    		{
    			wynik = nevile(*Tab,dim,x,dim2);
    			fprintf(fp,"%lf \t %lf \t %lf \n",x,wynik,sin(x));
    			x += skok;
    		}
	fclose(fp);
	}
}
