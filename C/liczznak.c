//Marcin Nasilowski
//Program liczacy znaki cyfry i wiersze...
#include<stdio.h>
int main()
{
//*****Deklaracje*******************************************************************
int dim = 5; //wymiar tablicy z iloscia znakow
int i;	      //zmienna uniwersalna	
int pom = 0;  //zmienna pomocnicza przyjmuje wartosc 1 gdy wpiszemy cokolwiek
int pom2 = 0; // zmienna zabezpieczajaca przedliczeniem wirtualnych wyrazow
int Tab[dim]; //tabela przechowujaca ilosc znakow
		//0 - Male litery
		//1 - Wielkie litery
		//2 - Cyfry
		//3 - Wyrazy tzn ciagi znakow oddzielone ,.;: "spacja" "tab" "enter"
		//4 - Wiersze
char c;       //wczytany znak
//**********************************************************************************


//*****wyswietlanie informacji poczatkowych*****************************************
printf("\n \nProgram zliczajacy ilosc wielkich i malych liter oraz cyfr \n");
printf("Program wyswietla rowniez ilosc wyrazow i wierszy\n");
printf("by zakonczyc wpisywanie nacisnij Ctrl + D \n\n");
printf("*******************************************************************\n");
//**********************************************************************************


//*****Zerowanie tablicy znakow*****************************************************
for(i=0;i<dim;i++)
{
Tab[i] = 0;
}
//**********************************************************************************


//*****Wczytywanie znak po znaku z klawiatury***************************************
i = getchar();
while(i!=EOF)
{
//*****Liczenie malych liter
	if((i >= 'a') && (i <= 'z'))
	{
		Tab[0]++;
		pom = 1;
	}
//*****Liczenie wielkich liter
	if((i >= 'A') && (i <= 'Z'))
	{
		Tab[1]++;
		pom = 1;
	}
//*****Liczenie cyfr
	if((i >= '0') && (i <= '9'))
	{
		Tab[2]++;
 		pom = 1;
	}
//*****Liczenie pozostalych znakow
	if((i == ' ')||(i=='\t')||(i=='\n')||(i == '.')||(i ==',')||(i ==';')||(i==':'))           
	{
		if(i == '\n'){Tab[4]++;}
		if(pom == 1)
		{
			Tab[3]++;
			
			pom = 0;
		}
	}

	i = getchar();
}
printf("\n*******************************************************************\n");
//**********************************************************************************


//*****Wyswietlanie informacji******************************************************
printf("\n'male' \t \t %d \n",Tab[0]);
printf("'wielkie' \t %d \n",Tab[1]);
printf("'wsz.litery' \t %d \n",Tab[1]+Tab[0]);
printf("'cyfry' \t %d \n", Tab[2]);
printf("'wyrazy' \t %d \n",Tab[3] + pom);
printf("'wiersze' \t %d \n",Tab[4] + 1);
//*****Koniec***********************************************************************
return 0;
}

