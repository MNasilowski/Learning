#include<stdio.h>
#include<stdlib.h>
int main()
{
float G[1200];  
float f;
int x;
int p;
int i,j;
FILE *fp;
x = 0;
p = 0;
    for(i=0;i<1200;i++){ G[i] = 0;} 
    //*****Wczytajmy filtr G
    if ((fp=fopen("filtr.txt", "r"))==NULL)
    {                           
           printf ("Nie mogê otworzyæ pliku test.txt do zapisu!\n");
           exit(1);
    }
    while(fscanf(fp,"%d %f",&x,&f)!=EOF)
    {   
        G[x] = f;
    }      
    //*****Uzupelniamy miejsca wolne
    for(i=1;i<1100 - x;i++)
    {            
    if((G[i] == 0)&&(p!=0)){G[i] = G[i-1];}
    if((G[i] != 0)&&(p==0)) { p = 1;}
    }
    fclose(fp);
    for(i=1;i<1100 - x;i++)
    {            
    printf("%d \t %f \n", i,G[i]);
    }
}
