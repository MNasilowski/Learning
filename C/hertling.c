#include<stdio.h>
#include<math.h>
#include<stdlib.h>
double PI = 3.1415;
double fun(double y, double a, double v)
{
return exp(-y*y)/((v-y)*(v-y) + a*a);
}

double hertling(double a, double v,double c)
{
	double suma = 0;
	double krok = 0.001;
	double min = -30;
	double max = 30;
	double y;
	c = pow(10,c);
	y = min;
	while(y<max)
		{
		suma += fun(y,a,v);
		y+=krok;
		}
	return (1 - exp(-c*suma*krok*a/PI));
}

int main(void)
{
double a = 1;
double vmin = -100;
double v;
double krokv = 0.1;
double vmax = 100;
double suma[4];
double c = -1;
char *plik[4];
int i;
plik[0] = "plik1.txt";
plik[1] = "plik2.txt";
plik[2] = "plik3.txt";
plik[3] = "plik4.txt";
FILE *fp;
//for(i = 0;i<4;i++)
//{
//c = -1;
/*	if((fp = fopen(plik[0],"w")) == NULL)
      	{
       	printf("nie udalo sie otworzyc pliku \n");
       	printf("program zostanie zakonczony \n");
	return 0;
      	}			
	v = vmin;
	while(v<vmax)
	{
		fprintf(fp,"%lf \t %lf \t  %lf \t  %lf \t %lf \t %lf \t %lf \n",v,hertling(a,v,-1),hertling(a,v,0),hertling(a,v,1),hertling(a,v,2),hertling(a,v,3),hertling(a,v,4));
		printf("%f",v);
		v+=krokv;
	}
	
fclose(fp);*/
//c++;
//}			

	if((fp = fopen(plik[2],"w")) == NULL)
      	{
       	printf("nie udalo sie otworzyc pliku \n");
       	printf("program zostanie zakonczony \n");
	return 0;
      	}
	c = -2;
	while(c<5)
	{
	v = 0;
	suma[0] = 0;
	suma[1] = 0;
	suma[2] = 0;
	suma[3] = 0;
	while(v<1000)
	{
		suma[0] = suma[0] + hertling(a,v,c);
		suma[1] = suma[1] + hertling(a/10,v,c);
		suma[2] = suma[2] + hertling(a/100,v,c);
		suma[3] = suma[3] + hertling(a/1000,v,c);
		if(v<100){v = v + 1;}
		if((v>=100)&&(v<=300)){v = v + 5;}
		if(v>300){v = v + 10;}
	}
	fprintf(fp,"%lf \t %lf \t %lf \t %lf \t %lf   \n",c,log10(suma[0]),log10(suma[1]),log10(suma[2]),log10(suma[3]));
	printf("%lf \t %lf \t  %lf  \n",c,suma[0],suma[1]);
	c = c + 0.1;
	}
return 1;
}
