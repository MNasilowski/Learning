//Marcin Nasilowski
//Program wyznaczajacy predkosc srednia na odcinku S wczytujacy godzine poczatku
//i godzine konca ruchu
#include<stdio.h>
int main()
{
int g1,g2,m1,m2;  //g1:m1 godzina poczatku ruchu
                  //g2:m2 godzina koñca ruchu
double  S, V;     //S przebyta droga
                  //V srednia predkoœæ
S = 10;            //Nadajemy wartosc zmiennej S
printf("prosze podac godzine rozpoczecia ruchu gg:mm np 14:25 \n");
scanf("%d : %d", &g1, &m1);
printf("prosze podac godzine konca ruchu gg:mm np 14:25 \n");
scanf("%d : %d", &g2, &m2);
V = S/(  (g2*1.0 + m2*1.0/60.0) - (g1*1.0 + m1*1.0/60.0));
printf("Srednia predkosc na drodze %f km wynosi %f km/h \n", S,V);
// scanf("%d",g1); //jak nie bedziesz widzial wyniku to usun // z poczatku lini
return 0;
}
