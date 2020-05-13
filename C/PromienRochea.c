//Marcin Nasi³owski
//Promieñ rochea
#include<stdio.h>
#include<math.h>
int sgn(double x)
{
    if(x > 0) return 1;
    if(x < 0) return -1;
    if (x==0) return 0;
}
double fp(float x, double q)
{
      return -sgn(x - 1/(1 - q))*(-q/(q + 1)) * 1 /((x - 1/(1 - q))*(x - 1/(1 - q)))  + sgn(x + q/(1 - q))*1/((x + q/(1 - q))*(x + q/(1 - q))) * 1 / (q + 1) - x;
}
float V(float x, float y, float z, double q)
{
      //return       (-q/(q +1))    /(sqrt((x - 1/(1 - q))*(x - 1/(1 - q)) + y*y + z*z))+
      //(-1/(q +1)) /( sqrt(  (x + q/(1 - q))*(x + q/(1 - q))  + y*y + z*z)) - 0.5*(x*x + y*y);
      return -q/sqrt(pow(1 + x*(q + 1),2) + (y*y + z*z)*(q + 1)*(q + 1)) -
              1/sqrt(pow(q - x*(q + 1),2) + (y*y + z*z)*(q + 1)*(q + 1)) -
              (x*x + y*y)/2;
      
}

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

double Skok(double f(), double x1, double x2, double mi, double eps)
{
       double x3;
       x3 = x1;
       do
       {
            x3 = x3 + eps;
       } 
       while((f(x3,mi) > 0));
       return x3;
}


int main()
{
    float x,y,z;
    double L1, L3, q;
    float V1;
    float ob, ob2;
     for(q = 0.01; q < 1;q= q + 0.1)
     {
     L1 = 0;
     do
     {
           L1 = L1 + 0.0001;
     }
     while(fp(L1,q)*fp(L1 +0.0001,q)> 0);
     L3 = -1/(q+1);
     do
     {
           L3 = L3 - 0.001;
     }
     while(fp(L3,q)*fp(L3 +0.001,q)> 0);
     V1 = V(L1,0,0,q);
     ob = 0;
     ob2 = 0;
     for(x = 0; x < 1;x = x + 0.01){
           for(y = 0; y < 1;y = y + 0.01){
                for(z = 0; z < 1 ;z = z + 0.01){ if(V(x,y,z,q) < V1) ob++; ob2++;}}}
               // printf("%f %f \n", ob, ob2);
                printf("%f %f %f \n",q,pow((0.23*ob/ob2),1.0/3.0), 0.49*pow(q,2.0/3.0)/(1 + log(1+pow(q,1.0/3.0))));
                
                
                
     }
getchar();    

    
}
