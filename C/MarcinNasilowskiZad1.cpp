#include<stdio.h>
#include<stdlib.h>
//wartoœæ wielomianu
double war(double Tab[],double x,int n)
{
int i;
double suma = 0;
       for(i=n;i>0;i--)
       {
                        suma = (suma + Tab[i])*x;
       }
       return suma+Tab[0];
}
//dzielenie wielomianu
double dziel(double Tab[],double Tab2[],double x,int n)
{
int i;
       for(i=n;i>0;i--)
       {
             Tab2[i-1] = Tab[i] - x*Tab2[i];      
       }
       return 1;
  
}

//mno¿enie wielomianu
double mnoz(double Tab[],double Tab2[],double x,int n)
{
       int i;
       for(i=n;i>=0;i--)
       {
                 Tab2[i+1] = Tab[i] + x*Tab[i+1];
       }
       Tab2[0] = Tab[0]*x;
       return 1;
}
int main(int argv,char *arg[])
{
int dim = 19;
double Tab[20];
double Tab2[20];    
int i=0;    
double a,pom;
FILE *fp;

if(argv == 3)
{
        if(sscanf(arg[2],("%lf"),&a)!=1){printf("bledny typ argumentu 2 \n");return 0;};
        if((fp = fopen(arg[1],"r")) == NULL)
        {
       	       printf("nie udalo sie otworzyc pliku \n");
       	       printf("program zostanie zakonczony \n");
               return -1;
        }
        while((fscanf(fp,"%lf",&Tab[i])==1)&&(i<dim-1)){i++;}
        dim = i;
        fclose(fp);
}
else
{
        if(argv == 2)
        {
                if((fp = fopen(arg[1],"r")) == NULL)
                {
       	                printf("nie udalo sie otworzyc pliku \n");
       	                printf("program zostanie zakonczony \n");
                        return -1;
                }
                i = 0;
                while((fscanf(fp,"%lf",&Tab[i])==1)&&(i<dim-1)){i++;} 
                dim = i;
                fclose(fp);
                printf("podaj wartosc a \n");
                scanf("%lf",&a);
        }
        else
        {
                printf("podaj kolejne wspolczynniki wielomianu max 19 \n");
                i = 0;
                while((scanf("%lf",&Tab[i])==1)&&(i<dim-1)){i++;} 
                dim = i;
                printf("podaj wartosc b \n");
                scanf("%lf",&a);
        }
}
printf("dim = %d",dim);
printf("wynik mnozenia wielomianu przez (x + a): \n");
mnoz(Tab,Tab2,a,dim);
for(i=0;i<dim + 1;i++)
{
                 printf("%lf \n",Tab2[i]);
                 Tab2[i] = 0;
}
printf("\n");


printf("wynik dzielenia wielomianu przez (x + b): \n");
dziel(Tab,Tab2,a,dim);
for(i=0;i<dim - 1;i++)
{
                 printf("%lf  \n",Tab2[i]);
                 Tab2[i] = 0;
}
printf("\n");


printf("wartosc wielomianu w punkcie b \n");
pom = war(Tab,a,dim);
printf("%lf \n",pom);
scanf("%lf",&Tab[1]);

}
