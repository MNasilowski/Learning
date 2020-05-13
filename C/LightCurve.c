//Marcin Nasilowski
//Co widzi Gaia

//Program ponzszy zamieni dowolna krzywa zmian blasku emitowana
//na krzywa zmian blasku obserwowana przez Gaie z odleglosci z

//*****READ ME*****************************************************************
//
//*****Wywolywanie:
//	nazwaprogramu nazwapliku_z_widmem argument1 argument2
//*****Argument1
//	T: Wyznacza ile czasu bedzie widoczny obiekt w zaleznosci od z
//	K: Tworzy krzywa zmian blasku dla z podanego w drugim argumencie
//	K: Ewentualnie tworzy zaleznosci jasnosc absolutna przesuniecie ku czewieni
//  N: Wynik koncowy, podaje ile supernowych zostanie znalezionych
//*****Czas w ktorym obiekt jest widoczny parametr T
//	Lightcurve.exe sn1a_flux.v1.2.dat T G.txt
//*****Wyznaczanie zaleznosci jasnosc absolutna przesuniecie ku czewieni
//LightCurve.exe sn1a_flux.v1.2.dat K G.txt

//Maksimum krzywych blasku dla supernowych wedlug 
//https://www.ast.cam.ac.uk/ioa/wikis/gsawgwiki/index.php/Triggers:Supernovae
//To odpowiednio
//1a = -18.99
//1bc = -17,75
//2L = 2n = -17,63
//2p = -16,44
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>
float c = 299792.458; //km/s
float H = 68;         //(km/s)/Mpc
float sz = 0.001;     //dkok przesuniecia
int T = 150;          //jak dluga krzywa jest
int D = 3000;         //maksymalna obserwowana dlugosc fali
int Z = 200;          //ilosc badanych z
float MM = 20;        //Maksymalna jasnosc obserwowana przez gaie
float ro = 0.301e-4;  //gêstosc supernowych w sztukach na Mpc^3 na 5 lat
float Time = 45;      //sredni czas po jakim gaia wraca do danego punkru
//******************************************************************************

//*****LUMINOCITY DISTANCE******************************************************
//*****Wszechswiat milnea
float dl(float z)
{
      if(z==0){return 1e-5;}
      return c*z*(1 + 0.5*z)/H;      
}
//******************************************************************************


int main(int argc, char* argv[])
{
//*****DEKLARACJE ZMIENNYCH*****************************************************
FILE  *fp;          //identyfikator do pliku wejsciowego z krzywa
FILE  *fG;          //identyfikator do pliku z filtrem
FILE  *ff;          //identyfikator do pliku koncowego
int   i, j, z;      //zmienna pomocnicza typu int zawsze siê przydaje:D naprzyklad do pêtli
float C = 299792.458; //km/s
float H0 = 68;      //(km/s)/Mpc
float d, l, f, k;   //Zmienne wczytujace d: dzien, l: dlugosc fali, f: strumien
int   x, y;         //zmienne sluzace do wypelniania tabel i zamiany flat na int
float flux[T][D];   //[dzien obserwacji][dlugosc fali w nanometrach] 
                    //tablica przyjmuje wartosc strumienia w danym dniu dla danej fali
float L[T];         //Tablica ze strumieniem bolometrycznym
float m[T];         //Tablica z jasnoscia
float zm[Z][T];     //Tablica STRUMIEN OD [przesuniecie ku czerwieni dzien]
float mm[Z][T];     //Tablica JASNOSC [przesuniecie ku czerwieni dzien]
float G[D];         //Filtr G
float time[Z];      //czas widocznosci
char  arg1;         //Argument podawany z funkcji co wyswietla
float arg2 = -1;    //Podajemy konkretne z
float pocz, kon;    //Pocz¹tek i koniec alfa i omega;
int   max;          //Dzien maksimum
float Lmax;         //maksymalny strumien absolutny
char *name;         //nazwa pliku z widmem
char *filtr;        //nazwa pliku z filtrem
float a;            //Juz nie pamietam po co ona byla
float M;	        //Jasnosc w maksimum
float N;            //Zmienna w ktorej jest przechowywana ilosc supenrowych
float V;            //Objetosc widzianego wszechswiata
//******************************************************************************



//*****NADAWANIE WARTOSCI POCZATKOWYCH******************************************
//*****Wczytywanie argumentow wywolywania
if(argc > 1) name = argv[1];
if(argc > 2) arg1 = argv[2][0];
if(argc > 3) filtr = argv[3];
//if((argc > 3)&&(strcmp(argv[2][0],"K"))) arg2 = atof(argv[4]);
if(argc == 4) arg2 = atof(argv[3]);
//*****Zerowanie tablic
for(i=0;i<T;i++)
{     
      L[i] = 0;
      m[i] = 0;         
      for(j = 0; j<D;j++) flux[i][j] = 0;
}
for(i=0;i<D;i++){G[i] = 0;}
for(i=0;i<Z;i++){for(j=0;j<T;j++){zm[i][j] = 0;}}
//*****Ustalanie maksymalnej jasnosci absolutnej
M = -18.99;
if(strcmp(name ,"sn1a_flux.v1.2.dat")  == 0)
{
ro = 0.301e-4;
if(strcmp(filtr ,"G.txt")==0  ) M = -18.99;
if(strcmp(filtr ,"U.txt")==0  ) M = -19.3;  //?
if(strcmp(filtr ,"B.txt")==0  ) M = -19.3; 
if(strcmp(filtr ,"V.txt")==0  ) M = -19.3;
if(strcmp(filtr ,"R.txt")==0  ) M = -17.63;  //?
if(strcmp(filtr ,"I.txt")==0  ) M = -19.05; 
}
if(strcmp(name ,"sn1bc_flux.v1.1.dat")==0 ) {M = -17.75;ro = 0.258e-4;}
if(strcmp(name ,"sn2l_flux.v1.2.dat")==0  ) {M = -17.63;ro = 1*0.447e-4/16.0;} 
if(strcmp(name ,"sn2p_flux.v1.2.dat")==0  ) {M = -16.44;ro = 14*0.447e-4/16.0;}
if(strcmp(name ,"sn2n_flux.v2.1.dat")==0  ) {M = -17.63;ro = 1*0.447e-4/16.0;}
     
  
//******************************************************************************


//*****WCZYTYWANIE DANYCH Z PLIIKU**********************************************
if ((fp=fopen(name, "r"))==NULL)
{                      
     printf ("Nie mogê otworzyæ pliku %s do zapisu!\n", name);
     exit(1);
}
while(fscanf(fp,"%f %f %f",&d,&l,&f)!=EOF)
{
     x = d; y = l/10;
     if(x < T) flux[x][y] = f;
}     
//*****chcemy miec widmo z rozdzielczoscia 1nm wiec uzupelniamy wolne punkty
//*****na razie metoda bezczelna czyli nadajemy wartosci najblizszej
//*****niezerowej wartosci na lewo
for(j=1;j<T;j++)
{
z = 0;
x = 0;
for(i=1;i<D-1;i++)
{               
    if((flux[j][i] != 0)&&(z==0)) { z = 1; x = 0;}            
    if((flux[j][i] == 0)&&(z!=0)){flux[j][i] = flux[j][i-1];x++;}
}
for(i=D;i > D - x;i--) flux[j][i] = 0;
}
z = 0;
fclose(fp);
//*****UZUPELNIAMY STRUMIEN*****************************************************
//*****przyblizam widmo dla kazdej z czestotliwosci widmem liniowym co
//*****nie jest prawda. jak znajda widma dla kazdego z dni to bedzie mozna
//*****to poprawic
for(z=0; z <D; z++)
{
x = 0;
y = 0;
for(i=1;i<T;i++)
{
      if(flux[i][z] != 0)
              {
                   a = (flux[i][z] - flux[x][z])/(i - x);
                   for(j = i;j>x;j--) flux[j-1][z] = flux[j][z] - a;
                   x = i;
              }              
} 
}
//*****Wczytajmy filtr G
if ((fp=fopen(filtr, "r"))==NULL)
{                               
    printf ("Nie moga otworzyc pliku z filtrem!\n");
    exit(1);
}
while(fscanf(fp,"%d %f",&x, &f)!=EOF)
{    
    G[x/10] = f/100;
}     

z = 0;
fclose(fp);
//******************************************************************************    
    
  
     
//*****LICZYMY STRUMIEN BOLOMETRYCZNY DLA KAZDEGO Z DNI*************************
for(i = 0; i <T; i++)
{
      L[i] = 0;
      for(j = 0;j<D;j++)
      {
           L[i] = L[i] +  flux [i][j]*G[j];
      }     
      if(L[i] > Lmax){Lmax = L[i]; max = i;}      
}

//for(j = 0;j<T;j++) printf("%d %e \n",j,L[j]);

//*****WYZNACZMY JASNOSC ABSOLUTNA *********************************************
//*****Wiemy ¿e dla maksimum mamy 19,3
//*****zatem ze wzoru pogsona bedziemy mogli policzyc pozostale
//*****m2  = M - 2,5 log(I2/I)
for(i = 0; i <T; i++)
{
      m[i] =  M - 2.5 *log10(L[i]/Lmax);
//      printf("%d %f \n", i - max, m[i]);
}
//*****DODAJEMY PRZESUNIECIE KU CZERWIENI I FILTR*******************************
//*****Strumien obserwowany dla danego dnia i przy danym z = 0.005z
//*****Czyli ca³kujemy strumieñ najbardziej prymitywn¹ metod¹ sumowania
//*****Bêdzie mo¿na zastosowaæ jak¹œ bardziej wyrafinowan¹ metodê
//*****Przy ca³kowaniu uwzglêdniam to ¿e œwiat³o jest obserwowane w filtrze G:)
//*****Oraz to ¿e ca³a krzywa jest trochê przesuniêta ku czerwieni wiêc ró¿ne
//*****zakresy promieniowania bêd¹ obserwowane dla ró¿nych z
for(z = 0; z < Z;z++)
{
      for(i = 0; i <T; i++)
      {
            zm[z][i] = 0;
            for(j = 0;j<D;j++)
            {
                  x = j/(z*sz+1);
                  zm[z][i] = zm[z][i] +  flux [i][x]*G[j];
            }  
      }     
}
//*****DODAJEMY ODLEGLOSC*******************************************************
//*****Teraz dodamy odleglosc pamietajac o tym ze wszechswiat jest dziwny i trzeba
//*****uwzgledniaæ krzywizne przestrzeni.
//*****krzywe zmian blasku dla danego z moga kogos interesowaæ wiec dodalem opcjê
//*****drukowania krzywej zmian blasku dla danego z oraz dla wszystkich 
//*****które sa liczone w celu wyznaczenia zaleznosci czas obserwacji 
//*****przesuniecie ku czerwini
//*****25 we wzorze ponizej wynika z wyrazenia odleglosci w megaparsecach
 if((arg1 == 'K')&&(arg2 != -1)) 
 {
          
      d = dl(arg2);   
      z = arg2/sz;             
      for(i = 0; i <T; i++)
      {
            mm[z][i] =  M - 2.5*log10(zm[z][i]/(Lmax*(d*d))) + 25;
            if((mm[z][i]> -100)&&(mm[z][i]< 100)) printf("%d %f \n",i -max ,mm[z][i]);      
      }    
      return 0;              
 } 
 else 
 {
     for(z = 0;z < Z; z++)
     {  
        d = dl(z*sz);
        for(i = 0; i <T; i++)
        {
              mm[z][i] =  M - 2.5*log10(zm[z][i]/(Lmax*(d*d))) + 25 ;  
        }  
      if(arg1 == 'K') printf("%f %f \n",z*sz,mm[z][max]);   
     }
}     
//*****JAK DLUGO GAIA JA WIDZI**************************************************
//*****Czyli jak dlugo obiekt jest jasniejszy od MM czyli zasiegu Gaii
//*****Poniewaz krzywa mam z dokladnoscia do dnia wyznaczona to jasnosc pomiedzy
//*****interwalami przyblizylem prosta
//*****Czas bedzie wyswietlany jezeli argument wywolania bedzie równy T
if((arg1 == 'T')||(arg1 == 'N'))
{
for(z = 0; z < Z;z++)
{
 time[z] = 0;
 pocz = 0;
 kon = 0;
 for(i = 0; i <T - 1; i++)
      {
       if(mm[z][i] <MM) time[z]++;      
//*****Ta czesc zwieksza dokladnosc wyznaczenia czasu przez interpolacje liniowa
//*****Miedzy dwoma kolejnymi punktami z danych. Na razie jest zakomentowana by 
//***** oszczedzac moc obliczeniowa. 
//        if((mm[z][i] > MM)&&(mm[z][i+1] < MM)) pocz = i +(mm[z][i] - MM)/(mm[z][i] - mm[z][i + 1]);
//        if((mm[z][i] < MM)&&(mm[z][i+1] > MM)) kon = i + (MM - mm[z][i])/(mm[z][i+1] - mm[z][i]);
//        time[z] = kon - pocz;
//Uwzglednic efekty relatywistyczne dla czasu
      }     
if(arg1 != 'N') printf("%f %e \n",z*sz,time[z]);
}
//*****WYZNACZANIE ILOSCI ZLICZEN***********************************************
if(arg1 == 'N') 
{
        N = 0;
        a = 0;
        V = 0;
        for(z = 1; z < Z;z++)
        {
        if(time[z] > Time) time[z] = Time;
        a  = 0.82*(pow(dl(z*sz),3) - pow(dl(z*sz - sz),3))*4*3.141596/3;
        N = N + ro*a*time[z]/Time;
        }

} 

}

printf("Ilosc supernowych: %f \n", N/365.24);
return 1;
//****************************KONIEC********************************************
}


