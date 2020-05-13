//Marcin Nasi³owski zad 2
//
//Program rozwi¹zuj¹cy równanie exp(x)-sin(2x)+x^3=0 metod¹ newtona

#include<stdio.h>
#include<math.h>
int podz = 100; //zmienna opisuj¹ca jak dokladnie bedzie badany znak funkcji
                //czym wiecej tym dokladniej
//badana funkcja
double f(double x)
{
    return exp(x)-sin(2*x)+x*x*x;   
}


//pochodna funkcji
double df(double x)
{
    return exp(x) - 2*cos(2*x) + 3*x*x;   
}

//druga pochodna funkcji
double d2f(double x)
{
      return exp(x) + 4*sin(2*x) + 6*x;   
}

//badanie stalosci znaku pierwszej pochodnej
int znak1(double x1, double x2)
{
    int i;
    double pom = (x2 - x1)/2;
    
    if(pom < 0) {return 0;}
    for(i=1;i<podz;++i)
    {
       if(df(x1)*df(x1+i*pom)< 0) {return -1;}
    }
}    

//badanie stalosci znaku drugiej pochodnej
int znak2(double x1, double x2)
{
    int i;
    double pom = (x2 - x1)/2;
    
    if(pom < 0) {return 0;}
    for(i=1;i<podz;++i)
    {
       if(d2f(x1)*d2f(x1+i*pom)< 0) {return -1;}
    }    
return 1;
}

//program glowny:)
int main()
{
double x1 = -2;     //pocz¹tek przedzialu 
double x2  = 2;     //koniec przedzialu
double pom;         //zmienna pomocnicz
double eps = 0.00002;//dok³adnosc rozwiazania


//Wyszukujemy punktu startowego sprawdzamy niezgodnoœæ znaków pochodnych funkcji
//Jezeli na badanym przedziale pierwsza i druga pochodna siê zmienia to ko¿ystamy
//z metody bisekcji do ograniczenia przedzia³u
//procedure powtarzamy do momentu w ktorym w przedziale pochodna pierwszego
//i drógiego stopnia mia³y jednakowy znak
while((znak1(x1,x2)==-1)||(znak2(x1,x2)==-1))
    {                 
    pom = (x1 + x2)/2;
    if(f(x1) * f(pom) < 0)
         {
         x2 = pom;
         }
    if(f(x2) * f(pom) < 0)
         {
         x1 = pom;
         }                                         
    }
//Jako punkt startowy metody newtona wybieramy punkt w którym funkcja i druga 
//pochodna s¹ tego samego znaku
if(f(x1)*d2f(x1)<0){pom = x2;}else {pom = x1;} 
//Ko¿ystamy z metody Newtona do momentu w którym ró¿nica miêdzy kolejnymi przybli¿eniami
//rozwi¹zania bêdzie mniejsza od zadanego epsilon. 
while(x2 - x1>eps)
{
        x1 = pom;                       
        x2 = x1 - f(x1)/df(x1);
        pom = x2;                        
}
//Wyswietlanie wynikow
printf("rozwiazaniem rownania exp(x)-sin(2x)+x^3 = 0 jest: \n");
printf("x = %f +- %f \n",pom,eps);
printf("wartosc funkcji dla x wynosi: \n");
printf("f(x) = %f",f(pom));
//Koniec:)
return 0;
}
