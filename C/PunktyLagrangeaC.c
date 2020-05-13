//Marcin Nasilowski
//Wyznaczanie polozenia liniowych punktow lagrangea
#include<stdio.h>
#include<math.h>
//Pare funkcji na dobry pocz¹tek
double Bisekcja(double f(), double x1, double x2, double mi, double eps)
{
       double x3;
       x3 = 0.5*(x1 + x2);
       do
       {
        if(f(x1,mi)*f(x2,mi)<0) 
        {
              if(f(x1,mi)*f(x3,mi)<0) x2 = x3; else x1 = x3;
              x3 = 0.5*(x1 + x2);
        }
    }
    while (fabs(x2 - x1) > eps);
return x3;
}
//Funkcja liczaca czestosci charakterystyczne wynik z plusem
double Lp(double x, double mi)
{
       double K;
       K = (1 - mi)/pow(fabs(x + mi),3) + mi/pow(fabs(x + mi -1),3);
       return sqrt(0.5*(2-K) + sqrt(3*K*(3*K - 2)));
}
//Funkcja liczaca czestosci charakterystyczne wynik z minusem
double Lm(double x, double mi)
{
       double K,x1;
       K = (1 - mi)/pow(fabs(x + mi),3) + mi/pow(fabs(x + mi -1),3);
       x1 = 0.5*(2-K) - sqrt(3*K*(3*K - 2));
       if (x1 > 0)  return sqrt(x1); else return 0;
}
//Funkcja opisuj¹ca polozenie pierwszego punktu lagrangea
double L1(double x, double mi)
{

       return x*(x+ mi)*(x + mi) *(x-1 + mi)*(x - 1 + mi) - (1 - mi) * ( x - 1 + mi)*(x-1 + mi) + mi*(x + mi)*(x+mi);
}
//Funkcja opisuj¹ca polozenie drugiego punktu lagrangea
double L2(double x, double mi)
{  
      return x - (1 - mi)/((x + mi)*(x + mi)) - mi/((x - 1 + mi)*(x - 1 + mi));
       
}
//Funkcja opisuj¹ca polozenie trzeciego punktu lagrangea
double L3(double x, double mi)
{

       return x + (1 - mi)/((x + mi)*(x + mi)) + mi/((x - 1 + mi)*(x - 1 + mi));
       
}

//Program glowny
int main()
{
    double x; //zmienna opisujaca polozenie na lini laczacej dwa masywne ciala
              //przyjmuje wartosc zero dla srodka masy ukladu
    double mi;//odleglosc pierwszej masy od srodka masy
    double logmi;        // Logarytm dziesietny z mi
    double xL1, xL2, xL3;// Polozenie odpowiednich punktow lagrangea
    double x1, x2, x3;   // Zmienne potrzebne do obslugi metody bisekcji
    double o11, o12;     // Czestosci charakterystyczne
    double o21, o22;     // Czestosci charakterystyczne
    double o31, o32;     // Czestosci charakterystyczne
    double eps = 0.0001; // Dokladnosc wyznaczanie punktow lagrangea
    mi = 0.000001;       // Miiiiiiiiiiiiiiiiiiiiiiiiiiiii
    
    printf("mi******  xL1*****  o11*****  xL2*****  o21******  xL3*****  o31*****\n");    
do
{
      
    //Wyznaczmy polozenie punktow lagrangea
    //Najlatwiejsza do implementacji jest metoda bisekcji, wiec nia sie posluze
    //Z wykladu wiemy, ¿e: 
    //    XL1 nale¿y do przedzialu [0,1-mi]
    //    XL2 nale¿y do przedzialu [1-mi,1.5]
    //    XL3 nale¿y do przedzialu [-1.5,-mi]
    //Punkt pierwszy
    x1 = 0-eps; x2 = 1 - mi+eps;
    xL1 = Bisekcja(L1,x1,x2,mi,eps);
    o11 = Lp(xL1,mi);
//    printf("L1  %lf  %lf  %lf \n", xL1,o11,o12);
    //Punkt drugi
    x1 = 1-mi-eps; x2 = 2;
    xL2 = Bisekcja(L2,x1,x2,mi,eps);
    o21 = Lp(xL1,mi);
//    printf("L2  %lf  %lf  %lf \n", xL2,o21,o22);
    //Punkt trzeci
    x1 = -2; x2 = -mi+eps;
    xL3 = Bisekcja(L3,x1,x2,mi,eps);
    o31 = Lp(xL1,mi);
//    printf("L3  %lf  %lf  %lf \n", xL3,o31,o32);
    printf("%lf  %lf  %lf  %lf  %lf  %lf  %lf \n",mi,xL1,o11, xL2, o21, xL3, o31);
     mi = mi*5; 
}
while(mi < 1);

    mi = 0.5;
    x1 = 0-eps; x2 = 1 - mi+eps;
    xL1 = Bisekcja(L1,x1,x2,mi,eps);
    o11 = Lp(xL1,mi);
    //Punkt drugi
    x1 = 1-mi-eps; x2 = 2;
    xL2 = Bisekcja(L2,x1,x2,mi,eps);
    o21 = Lp(xL1,mi);
    //Punkt trzeci
    x1 = -2; x2 = -mi+eps;
    xL3 = Bisekcja(L3,x1,x2,mi,eps);
    o31 = Lp(xL1,mi);
    printf("%lf  %lf  %lf  %lf  %lf  %lf  %lf \n",mi,xL1,o11, xL2, o21, xL3, o31);
    mi = mi*5; 

scanf("%lf",&x3);
return 1;       
}
