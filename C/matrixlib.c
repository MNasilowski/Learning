#include<stdio.h>
int solvA(double *A,double *V,double *W,int dim)
{
    int i,j,k;
    double C[dim][dim+1];
    double suma;
    k = 0;
    
//    przpisywanie tablicy A do C 
    for(i=0;i<dim;i++)
    {
         for(j=0;j<dim;j++)
         {
            C[i][j]  = *(A+i*dim + j);             
         }
         C[i][dim] = V[i];
    }
//   eliminacja macierzy B poszerzonej o V metod¹ gausa*/
    for(k=1;k<dim;k++)
    {
         for(i=k;i<dim;i++)
         {
             for(j = k;j<=dim;j++)
             {    
              C[i][j] = C[i][j] - C[k-1][j]/C[k-1][k-1] * C[i][k-1];           
             }
         }
    }
//   zerowanie elementow pod przekatna
    for(i=0;i<dim;i++)
    {
         for(j=0;j<i;j++)
         {
              C[i][j] = 0;              
         }
    }
//rozwiazywanie rownania
    suma = 0;
    for(i = dim;i>=0;i--)
    {   
        W[i] = (C[i][dim] - suma)/C[i][i];
        suma = 0;
        for(j=i;j<dim;j++)
        {
                          suma = suma + C[i-1][j]*W[j];
        }  
    } 
return 0;
}
int solvB(double *A,double *V,double *W,int dim)
{
    
}

int main()
{
   
    int dim = 3;
    double A[dim][dim], B[dim][dim], V[dim],W[dim];
    int i,j;

             A[0][0] = 1;
             A[0][1] = 1;
             A[0][2] = 1;
             A[1][0] = 2;
             A[1][1] = 3;
             A[1][2] = -1;
             A[2][0] = 3;
             A[2][1] = -1;
             A[2][2] = 2;
             V[0] = 6;
             V[1] = 5;
             V[2] = 7;
diagA(&A,&V,&W,dim); 
printf("\n ********************** \n");   
   for(i=0;i<dim;i++)
    {
         printf("%lf \n",W[i]);
    }
    scanf("%d",&i);
}
