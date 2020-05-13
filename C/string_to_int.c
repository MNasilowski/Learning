//Marcin Nasilowski
//Program zamieniajacy ciag znakow podany jako argument wywolania na int
#include<stdio.h>
#include<math.h>
#include<ctype.h>
//funkcja zamieniajaca ciag znakow na liczbe
int atoi2(char *licz)
{
int i = 0;
int suma = 0;
while(('0'<=licz[i])&&(licz[i]<='9')) {suma =+ suma*10 + licz[i] - '0';i++;}
return suma;
}
//funkcja sprawdzajaca powyzsza procedure
int main(int n,char *arg[])
{
int suma;
suma = atoi2(arg[1]);
printf("program zamieniajacy ciag znakow podany jako argument wywolania na int\n");
printf("podana liczba zamieniona na int wynosi %d \n",suma);
return 0;
}
