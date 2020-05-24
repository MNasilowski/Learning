#include<stdio.h>
#include<math.h>

float V(float x, float y, float z, double q)
{
return -((x - q/(1 + q))*(x - q/(1 + q)) + y*y + 2*q/((1 + q)*sqrt((x - 1)*(x-1) + y*y + z*z)) + 2/((1 + q)*sqrt(x*x + y*y + z*z)));
}
// L(x,y,z,q) = (x - q/(1 + q))*(x - q/(1 + q)) + y*y + 2*q/((1 + q)*sqrt((x - 1)*(x-1) + y*y + z*z)) + 2/((1 + q)*sqrt(x*x + y*y + z*z)) 
float L3(float q)
{
      float x,s;
      x = -2;
      s = 0.001;
      do
      {
            x = x+s;
      }
      while(V(x,0,0,q)<V(x+s,0,0,q));
      return x;
}


float L1(float q)
{
      float x,s;
      s = 0.0001;
      x = 0;
      do
      {
            x = x+s;
      }
      while(V(x,0,0,q)<V(x+s,0,0,q));
      return x;
}


float main()
{
      float q,pocz,kon,eps,ob, V1;
      float x,y,z;
      q = 0;
      eps = 0.005;
      ob = 0;
      do
      {
      q = q + 0.05;
      ob = 0;
      pocz = L3(q);
      kon = L1(q);
      V1 = V(kon,0,0,q);
      x = kon;
          do
          {
                  y = 0;
                  do
                  {
                   z = 0;     
                            do
                            {
                                    if(V(x,y,z,q)<V1) ob++;
                                    z = z + eps;
                            }
                            while(V(x,y,z,q)<V1);
                            z = 0;
                  y = y + eps;
                  }
                  while(V(x,y,z,q)<V1);
                  y = 0;
          x = x - eps;
          }
          while(V(x,y,z,q)<V1);
          printf("%f \t %f \t %f \n",q,pow(ob*0.954,0.333)*eps,0.38 + 0.2*log10(1/q));
      //printf("%f \t %f \t %f \n",q,pow(ob*0.954,0.333)*eps,0.49*pow(1.0/q,2.0/3.0)/(1 + log(1+pow(1.0/q,1.0/3.0))));
      //printf("%f \t %f \t %f \n ",q ,V(pocz,0,0,q), V(kon,0,0,q));
      }
      while(q<10);
      
      return 1;
}
