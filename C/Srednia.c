#include<stdio.h>

int main(int argc, char* argv[])
{
float z1, m1, z, n, msrednie, zkryt;
FILE  *fp;          //identyfikator do pliku wejsciowego z krzywa

if ((fp=fopen("SNIa_mz_obs.dat", "r"))==NULL)
{                      
     printf ("Nie moge otwozyc pliku  do zapisu!\n");
     return 1;
}
n = 0;
zkryt = 0.001;
z = 0;
do
{
	do
	{
	 	if (fscanf(fp,"%f %f",&z1,&m1)!=EOF) 
			{
			n = n + 1;
			msrednie = msrednie + m1;
			}
		else
			{
			return 1;
			}
	}
	while(z1<zkryt);
	msrednie = msrednie/n;
	printf("%f %f \n",zkryt - 0.0005,msrednie);
	n = 0;
	msrednie = 0;
	zkryt = zkryt + 0.001;
}
while(zkryt<0.01);



do
{
	do
	{
	 	if (fscanf(fp,"%f %f",&z1,&m1)!=EOF) 
			{
			n = n + 1;
			msrednie = msrednie + m1;
			}
		else
			{
			return 1;
			}
	}
	while(z1<zkryt);
	msrednie = msrednie/n;
	printf("%f %f \n",zkryt - 0.005,msrednie);
	n = 0;
	msrednie = 0;
	zkryt = zkryt + 0.01;
}
while(zkryt<0.3);


return 0;
}
