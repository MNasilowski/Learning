//Marcin Nasilowski
//Zad1
//******************************************************************************
//******************************README******************************************
//Program znajdujacy dlugosc podanego dnia na podanej szerokosci geograficznej
//Wyswietla rowniez godzine (UT) poczatku i konca zmierzchu cywilengo
//******************URUCHAMIANIE************************************************
//czad1.4.exe dlugosc szerokosc data
//dlugosc   w formacie xxhyymzzs lub xx.dddddd
//szerokosc w formacie ss:mm:ss lub ss.dddddd
//data      w formacie dien.miesiac.rok
//kolejnosc parametrow jest istotna

//czad1.4.exe plik
//plik      nazwa pliku zawierajacego polozenia i daty
//zawartosc pliku:
//			plik powinien skladac sie z 3 kolumn oddzielonych spacjami lub tabam
//			kazda kolumna odpowiada kolejno dlugosci szerokosci dacie
//			kolejnosc jest istotna
//			format danych jak wyzej
//*****************BLEDY********************************************************
//nie udalo sie otworzyc pliku
//      Wyswietlany miedzy innymi gdy podany plik nie istnieje
//      Lub podano argument nie bedacy nazwa pliku          wartosc zwracana -1;
//podano bledne argumenty xxx
//		Zosteje wyswietlony gdy ktorys z argumentow w lini jest bledny
//		cyfry na koncu odpowiadaja kolejnym argumentom
//			1 oznacza poprawna wartosc
//			0 oznacza bladna wartosc danego argumentu
//Nie odpowiednia ilosc argumentow
//		Wyswietlana gdy ilosc argumentow w czasie uruchomiania programu jest
//		rozna od 1 lub 3                                     wartosc zwracana 0;
//Bledna ilosc argumentow w lini
//		Blad oznacza zbyt doza lub zbyt mala liczbe argumentow w lini pliku
//		pusta linia jest traktowana jako 0 argumentow czyli jest ich za malo
//      argumenty w lini pliku moga byc oddzielone tabulatorami lub spacjami
//*******************WYNIKI*****************************************************
//Program zwraca tabele skladajaca sie z 6 kolumn
// kolumny 1-3        opowiednio dlugosc szerokosc data wczytane z pliku
// kolumna 4 czas     oznacza czas miedzy wschodem a zachodem cywilnym
// kolumna 5 poczatek oznacza godzine poczatku zmierzchu cywilnego czyli moment 
//                    zachodu slonca za choryzont wynik w UT
// kolumna 6 koniec   oznacza godzine zachodu cywilnego czyli momentu w ktorym
//                    wysokosc slonca wynosi -6 wynik podany w UT
//Format kol 4-6      hh:mm:ss gdzie
//                                  hh - godzina
//                                  mm - minuty
//                                  ss - sekundy
//Zamiast czasu poczatku i konca w kolumnach moze pojawic sie informacja
//"trwa dzien/noc polarny" oznacza ona ze w danym dniu na danej szerokosci trwa
// polarny dzien/noc cywilny; 
//*****************UWAGI********************************************************
//1. Program pomija refrakcje 
//2. Definicja 
//   normalnym urzytkowaniem programu nazywamy urzytkowanie nie zakonczone 
//   'Segmentation fault'
//******************************************************************************
#include<stdio.h>
#include<math.h>
#include<stdlib.h>
//ZMIENNE GLOBALNE
char timez[8];
char timec[8];
char timed[8];
double PI = 3.1415;
double eps = 0.4090;
//PI - wartosc pi przyjmowana w ponizszym programie
//eps- nachylenie ekliptyki do rownika w radianach
//obliczanie strefy czasowej****************************************************
//zrezygnowalem z oblicznia czasu strefowego bo granice stref nie sa takie proste
//fragmentu nie usuwam gdyz moze w wersi .pro bedzie taka mozliwosc;
/*int strefa(double la)
{
    int i;
    for(i = 0;i<24;i++)
    {
      if((la>(i-0.5))&&(la<(i+0.5))){return i;}
    }
    return -1;
}*/
//obliczanie godziny zdazenia w UT**********************************************
double czasUT(double t, double la)
{
       t = 12 + t - la;
       if(t<0){t=24+t;}
       return t;
}
//konwersja cyfry na znak*******************************************************
char itoc(int i)
{
     if(i == 0){return '0';}
     if(i == 1){return '1';}
     if(i == 2){return '2';}
     if(i == 3){return '3';}
     if(i == 4){return '4';}
     if(i == 5){return '5';}
     if(i == 6){return '6';}
     if(i == 7){return '7';}
     if(i == 8){return '8';}
     if(i == 9){return '9';}
     return 'r';
}
//ponizej sa 3 podobne(prawie takie same) funkcje gdy¿ latwiej jest skopiowac niz
//kombinowac z dodatkowymi zmiennymi, warunkami itd, pozatym w ten sposob program 
//powinien troche szybciej dzialac - nie musi sprawdzac warunkow
int ttocz(double t)
//ttocz zwraca czas w postaci hh:mm:ss wartosc do zmiennej globalnej************
//konwertuje zachod "zwykly"
{
int pom;
    timez[2]=':';
    timez[5]=':';
    pom = t/10;
    timez[0] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timez[1] = itoc(pom);
    t = t - pom;
    t = t*60;
    pom = t/10;
    timez[3] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timez[4] = itoc(pom);
    t = t - pom;
    t = t*60;
    pom = t/10;
    timez[6] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timez[7] = itoc(pom);
return 1;
}
//ttocc zwraca czas w postaci hh:mm:ss wartosc do zmiennej globalnej************
//konwertuje zachod cywilny
int ttocc(double t)
{
int pom;
    timec[2]=':';
    timec[5]=':';
    pom = t/10;
    timec[0] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timec[1] = itoc(pom);
    t = t - pom;
    t = t*60;
    pom = t/10;
    timec[3] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timec[4] = itoc(pom);
    t = t - pom;
    t = t*60;
    pom = t/10;
    timec[6] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timec[7] = itoc(pom);
return 1;
}
int ttocd(double t)
//ttocd zwraca czas w postaci hh:mm:ss wartosc do zmiennej globalnej************
//konwertuje dlugosc dnia
{
int pom;
    timed[2]=':';
    timed[5]=':';
    pom = t/10;
    timed[0] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timed[1] = itoc(pom);
    t = t - pom;
    t = t*60;
    pom = t/10;
    timed[3] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timed[4] = itoc(pom);
    t = t - pom;
    t = t*60;
    pom = t/10;
    timed[6] = itoc(pom);
    t = t - pom*10;
    pom = t;
    timed[7] = itoc(pom);
return 1;
}
//********************NUMER DNIA W ROKU*****************************************
int podat(int dz,int m, int rok)
{
int k,d;
d = 0;
k = 0;
//sprawdzamy czy rok jest przestepny
if ( ((rok%4 == 0)&& (rok%100!=0))  || (rok%400==0)){k = 1;}
 switch(m)
     {     
        case 1  : d = 0;break;
        case 2  : d = 1;break;
        case 3  : d = -1 + k;break;
        case 4  : d = 0 + k;break;
        case 5  : d = 0 + k;break;
        case 6  : d = 1 + k;break;
        case 7  : d = 1 + k;break;
        case 8  : d = 2 + k;break;
        case 9  : d = 2 + k;break;
        case 10 : d = 3 + k;break;  
        case 11 : d = 3 + k;break;
        case 12 : d = 4 + k;break;
     }	
d = dz + 30*(m-1) + d;
return d;
}
//********************ANALIZA SZEROKOSCI****************************************
double szerokosc(char *szer)
{
int  i,j,tab[2];
double fi,pom,k;
i = 0;
j = 0;
tab[0] = 0;tab[1] = 0;
do
{
  if((szer[i]<='9')&&(szer[i]>='0')) {j++;}
  if((szer[i]=='.')&&(tab[1]==0)&&(tab[0]==0)) {j++;tab[0]++;}
  if((szer[i]==':')&&(tab[1]< 2)&&(tab[0]==0)) {j++;tab[1]++;}
  i++;
  
}
while(szer[i]!='\0');
if(j!=i){return -1;}
fi = 0;
i=0;
k=100;
//*****CZESCI CALKOWITE SZEROKOSCI
do
{
     if((szer[i]>'9')||(szer[i]<'0'))
     {
          return(-1);
     }  
     fi = fi + (szer[i] -'0')*k;  
     i++;
     k=k/10; 
}
while ((szer[i]<='9')&&(szer[i]>='0'));
if(i == 1){fi = fi/100;}
if(i == 2){fi = fi/10;}
//*****JEZELI W FORMACIE STOPNIE.DDDDD
if(szer[i] == '.')
{
i++;
     do
     {
             if((szer[i]>'9')||(szer[i]<'0'))
             {
                  return(-1);
             }  
             fi = fi + (szer[i] -'0')*k;  
             i++;
             k=k/10; 
     }
     while ((szer[i]<='9')&&(szer[i]>='0'));
}
else
{
//*****JEZELI W FORMACIE SS:MM:SS
 if(szer[i] == ':')
 {
     j=1;
     k=10;
     pom = 0;
     do
     {
             if((szer[i+j]>'9')||(szer[i+j]<'0')) 
             {
                 return(-1);
             } 
              
             pom = pom + (szer[i+j] -'0')*k;  
             j++;
             k=k/10; 
     }
     while ((szer[i+j]<='9')&&(szer[i+j]>='0'));
     if(j == 2){pom = pom/10;}
     fi = fi + pom/60;
     i = i+j;
     if(szer[i] == ':')
     {
             j=1;
             k=10;
             pom = 0;
             do
             {
             if((szer[i+j]>'9')||(szer[i+j]<'0')) 
             {
                 return(-1);
             }  
             pom = pom + (szer[i+j] -'0')*k;  
             j++;
             k=k/10; 
             }
             while ((szer[i+j]<='9')&&(szer[i+j]>='0'));
             if(j == 2){pom = pom/10;}
             fi = fi + pom/3600;          
     }
 }
}
fi = fi*PI/180;
return fi;
}
//********************DLUGOSC DNIA**********************************************
double daylen(double dzi,double fi,int typ)
//zmienna typ sprawia ze procedura jest bardziej uniwersalna
//dla zachodu cywilnego to bedzie 6
//dla morskiego 12 itd...
{
//algorytm obliczajacy dlugosc dnia
int n = 1;
double dzie,del,twz,costwz;
//zamiana epsilona na radiany
//+8 poniewaz 1.10 jest 8 dniem od przesilenia
if(dzi > 365.2425){dzi = dzi - 365.2425;}
dzie = (dzi+8)*1.0;
//tutaj sprawdzam czy noc jest dluzsza czy krutsza od dnia
if((dzi < 81)||(dzi>266)){n = -1;}
dzie = PI - (dzie)*2.0/365.24 *PI;
if(dzie<0){dzie = dzie*(-1);}
//liczymy deklinacje slonca "n" zapewnia ¿e w zime deklinacja bedzie ujemna:0
del = n*(eps - asin(sin(dzie)*sin(eps)));
costwz = (cos((90 + typ)*PI/180)/(cos(del)*cos(fi))) - (tan(del) * tan(fi));
//tutaj sa warunki na noc i dzien polarny
if(costwz > 1) {return -1;}//"trwa noc polarny");
if(costwz < -1){return -2;}//"trwa dzien polarny");
twz = acos(costwz);
//zamieniam radiany na kat godzinny:)
twz = twz *180/PI /15;
return twz;   
}

//sprawdza czy miesiac ma odpowiednia ilosc dni
int chekday(int day, int mon)
{
    if((mon == 1)&&(day > 31)){return 0;}
    if((mon == 2)&&(day > 29)){return 0;}
    if((mon == 3)&&(day > 31)){return 0;}
    if((mon == 4)&&(day > 30)){return 0;}
    if((mon == 5)&&(day > 31)){return 0;}
    if((mon == 6)&&(day > 30)){return 0;}
    if((mon == 7)&&(day > 31)){return 0;}
    if((mon == 8)&&(day > 31)){return 0;}
    if((mon == 9)&&(day > 30)){return 0;}
    if((mon == 10)&&(day > 31)){return 0;}
    if((mon == 11)&&(day > 30)){return 0;}
    if((mon == 12)&&(day > 31)){return 0;}
return 1;
}
//********************ANALIZA DNIA**********************************************
int dzien(char *data)
{
int i,j,k, day, mon, year;
i = 0;
k = 10;
day = 0;
//*************
do
{
    if((data[i]>'9')||(data[i]<'0')) 
    {
        return(-1);
    }  
    day = day + (data[i] -'0')*k;  
    i++;
    k=k/10; 
}
while ((data[i]!='.')&&(data[i]!='/'));
//**************
if(i==1){day=day/10;}
//**************
if((data[i]=='.')||(data[i]=='/'))
{
j=1;
mon = 0;
k=10;

   do
   {   
     if((data[i+j]>'9')||(data[i+j]<'0')) 
     {
        return(-1);
     }  
     mon = mon + (data[i+j] -'0')*k;  
     j++;
     k=k/10; 
   }
   while ((data[i+j]!='.')&&(data[i+j]!='/'));
if(j==2){mon=mon/10;}
i=i+j;
   if((data[i]=='.')||(data[i]=='/'))
   {
   i++;
   j=0;
   year = 0;
   k=1000000;
       do
       {
            if((data[i+j]>'9')||(data[i+j]<'0')) 
            {
                return(-1);
            }  
       year = year + (data[i+j] -'0')*k;  
       j++;
       k=k/10; 
       }
       while (data[i+j]);
       year = year/(k*10); 
   } 
}
else{return 0;}
if(chekday(day,mon) == 0){return -1;}
i = podat(day,mon,year);
return i;
}
//********************ANALIZA DLUGOSCI GEOGRAFICZNEJ****************************
double dlugosc(char *szer)
{
int  i,j,tab[4];
double fi,pom,k;
//fragment sprawdzajacy liczbowosc danych
for(i=0;i<4;i++){tab[i]=0;}
j =0;
i =0;
do
{
if((szer[i]<='9')&&(szer[i]>='0')) {j++;} 
if((szer[i]=='.')&&(tab[0]==0)&&(tab[1]==0)&&(tab[2]==0)&&(tab[3]==0)) {j++;tab[0]++;}
if((szer[i]=='h')&&(tab[0]==0)&&(tab[1]==0)&&(tab[2]==0)&&(tab[3]==0)) {j++;tab[1]++;}
if((szer[i]=='m')&&(tab[0]==0)&&(tab[1]==1)&&(tab[2]==0)&&(tab[3]==0)) {j++;tab[2]++;}
if((szer[i]=='s')&&(tab[0]==0)&&(tab[1]==1)&&(tab[2]==1)&&(tab[3]==0)) {j++;tab[3]++;}
i++;
}
while(szer[i]!='\0');
if(j!=i){return -1;}

fi = 0;
i=0;
k=100;
//*****CZESCI CALKOWITE SZEROKOSCI
do
{
     if((szer[i]>'9')||(szer[i]<'0'))
     {
          return(-1);
     }  
     fi = fi + (szer[i] -'0')*k;  
     i++;
     k=k/10; 
}
while ((szer[i]<='9')&&(szer[i]>='0'));
if(i == 1){fi = fi/100;k=k/100;}
if(i == 2){fi = fi/10;k=k/10;}

//*****JEZELI W FORMACIE STOPNIE.DDDDD
if(szer[i] == '.')
{
i++;
     do
     {
             if((szer[i]>'9')||(szer[i]<'0'))
             {
                  return(-1);
             }  
             fi = fi + (szer[i] -'0')*k;  
             i++;
             k=k/10; 
     }
     while ((szer[i]<='9')&&(szer[i]>='0'));
}
else
{
//*****JEZELI W FORMACIE HHhMMmSSs
 if(szer[i] == 'h')
 {
     j=1;
     k=10;
     pom = 0;
     do
     {
             if((szer[i+j]>'9')||(szer[i+j]<'0')) 
             {
                 return(-1);
             } 
              
             pom = pom + (szer[i+j] -'0')*k;  
             j++;
             k=k/10; 
     }
     while ((szer[i+j]<='9')&&(szer[i+j]>='0'));
     if(j == 2){pom = pom/10;}
     fi = fi + pom/60;
     i = i+j;
     if(szer[i] == 'm')
     {
             j=1;
             k=10;
             pom = 0;
             do
             {
             if((szer[i+j]>'9')||(szer[i+j]<'0')) 
             {
                 return(-1);
             }  
             pom = pom + (szer[i+j] -'0')*k;  
             j++;
             k=k/10; 
             }
             while ((szer[i+j]<='9')&&(szer[i+j]>='0'));
             if(j == 2){pom = pom/10;}
             fi = fi + pom/3600;          
     }
 }
}
return fi;
}
//******************************************************************************





//********************PROGRAM GLOWNY********************************************
int main(int n,char*arg[])
{
char *plik,dl[12],sz[12],dz[10];
char  pom, pom1;
int day,k, i,j,a,b,c,z,znaksz;
FILE *fp, *fp2;
double fi,la,H,H2,zachz,zachc,strona;
a = 1;b = 1;c = 1;
znaksz = 1;
printf("*****************************************************\n");
printf("       Program znajdujacy czas dnia cywilnego        \n");
printf("**oraz godzine poczatku i konca zmierzchu cywilnego* \n");
printf("     dla miejsca o danej dlugosci i szerokosci       \n");
printf("                     w danym dniu                    \n");
printf("*****************************************************\n");
//******************************************************************************

//analiza parametrów
//jezeli jest jeden parametr to zakladam ze jest to nazwa pliku
if(n == 2)
{
     plik = arg[1];
     //sprawdzamy czy istnieje
     if((fp = fopen(plik,"r")) == NULL)
     {
       	printf("nie udalo sie otworzyc pliku \n");
       	printf("program zostanie zakonczony \n");
        return -1;
     }
     fp2 = fopen(plik,"r"); 
}
else
{
//jezeli sa 3 parametry to obsluga argumentow z lini polecen********************
    if(n == 4)
    {
         if(arg[2][0] == '-')
         {
         arg[2][0] = '0';znaksz = -1;
         strona = 182.62;
         fi = szerokosc(arg[2]);
         arg[2][0] = '-';
         }
         else
         {
         fi = szerokosc(arg[2]);  
         strona = 0;  
         }
         
//         if(arg[2][0] == '-'){arg[2][0] = '0';znaksz = -1;}
         la = dlugosc(arg[1]);
         day = dzien(arg[3]);

//sprawdzanie czy wszystkie dane sa poprawne
         if((fi<0)||(fi>90)){b = 0;}
         if((day<0)||(day>366)){c = 0;}
         if((la<0)||(la>24)){a = 0;}
//jezeli sa bledy to...
         if(a*b*c == 0)
         {
                  printf("podano bledne argumenty %d%d%d \n",a,b,c);
                  printf("KONIEC");
                  return 1;
         }
         H = daylen(day*1.0 + strona,fi,6);
         if(H == -1)
         {
                 printf("%-10s %-10s %-10s trwa noc polarna \n",arg[1],arg[2],arg[3]);     
         }
         else
         {
                 if(H == -2)
                 {
                           printf("%-10s %-10s %-10s trwa dzien polarny \n",arg[1],arg[2],arg[3]);
                 }
                 else
                 {
                          zachc = czasUT(H,la);
                          H2 = daylen(day*1.0 + strona,fi,0);
                          zachc = czasUT(H,la);
                          zachz = czasUT(H2,la);
                          ttocz(zachz);
                          ttocc(zachc);
                          ttocd(2*H);
                          printf("\n");
                          printf("dlugosc    szeroko    data       czas       poczatek   koniec     \n");
                          printf("__________________________________________________________________\n");
                          printf("%-10s %-10s %-10s %-10s %-10s %-10s \n",arg[1],arg[2],arg[3],timed,timez,timec); 
                 }
         }
         return 1;    
    }
//******************************************************************************
    else
    {
        printf("Nie odpowiednia ilosc argumentow");
        return 0;
    }
}
//*****wczytywanie lini danych z pliku 
printf("plik z danymi: %s \n \n",plik); 
printf("dlugosc    szeroko    data       czas       poczatek   koniec     \n");
printf("__________________________________________________________________\n");     
do
{
k = 0;
//sprawdzanie ile arfumentow jest w wierszu
//zaklasam ze argumenty sa oddzielone spacjami lub tabami
//jezeli nie sa oddzielone spacjami lub tabami to blad danych
j = 0;
pom1 = ' ';

    do
    {
     z = fscanf(fp2,"%c",&pom);
     j++;
     if(((pom=='\t')||(pom==' '))&&((pom1!='\t')&&(pom1!=' '))){k++;}
     pom1 = pom;
    }
    while((pom!='\n')&&(j<30));
    
    if(k == 2)
    {         
              fscanf(fp,"%s %s %s",dl,sz,dz);             
              znaksz = 1;            
//sprawdzanie znaku szerokosci;
              if(sz[0] =='-')
              {
                       znaksz=-1;
                       sz[0] = '0';
                       fi = szerokosc(sz);
	                   strona = 182.62;
	                   sz[0] ='-';
              }
              else
              {
                   fi = szerokosc(sz);
                   znaksz = 1;
                   strona = 0;      
              }
              
//przeksztalcanie wartosci na cos bardziej przydatnego:)
              la = dlugosc(dl);
              day = dzien(dz);
//sprawdzanie czy wszystkie dane sa poprawne
              if((fi<0)||(fi>90)){b = 0;}
              if((day<0)||(day>366)){c = 0;}
              if((la<0)||(la>24)){a = 0;}              
//jezeli sa bledy to...
              if(a*b*c == 0)
              {
                       printf("podano bledne argumenty %d%d%d \n",a,b,c);
                       a = 1; b = 1; c = 1;
                       
              }
//jezeli nie ma bledow to...
              else
              {
                  H = daylen(day+strona,fi,6);
                  if(H == -1)
                  {
                           printf("%-10s %-10s %-10s trwa noc polarna \n",dl,sz,dz);   
                  }
                  else
                  {
                      if(H ==-2)
                      {
                           printf("%-10s %-10s %-10s trwa dzien polarny \n",dl,sz,dz);             
                      }
                      else
                      {
                          H2 = daylen(day+strona,fi,0);
                          zachz = czasUT(H2,la);
                          zachc = czasUT(H,la);
                          ttocz(zachz);
                          ttocc(zachc);
                          ttocd(2*H);
                          printf("%-10s %-10s %-10s %-10s %-10s %-10s \n",dl,sz,dz,timed,timez,timec); 
                      }
                  }
              }             
      }
      else
      {
          printf("bledna ilosc argumentow w lini \n");
          fscanf(fp,"\n");
      }
}
while(z==1);
close(fp);
close(fp2);
return 1;
}
//****************************KONIEC********************************************
