# -*- coding: utf-8 -*-
"""
Created on Tue Jun 26 18:41:59 2018

@author: Marcin Nasilowski
"""



"""
Funkcja dokonująca rozkładu macierzy na lewo: L i prawostroną: U
Argumentem funkcji jest dowolna macierz kwadratowa
Funkcja zwraca dwie macierze: L i U w podanej kolejnosci
"""
import multiprocessing
import os
import time




def WyznacznikMacierzy(matrix):
    L,U = LU(matrix)
    wyznacznik = 1
    size = len(matrix)
    for i in range(size):
        wyznacznik *= U[i][i]
    return wyznacznik
        


#L, U, matrix zmienne globalne
def WyznaczElementU(L,U,matrix,i,j):
    print(f'Process {os.getpid()}  rozpoczęto obliczanie elementu {i}{j}')
    suma = 0
    for k in range(i):
        suma += L[i][k]*U[k][j]
    print(f'Process {os.getpid()}  zakonczono obliczanie elementuU {i}{j}')
    return matrix[i][j] - suma

def WyznaczElementL(L,U,matrix,i,j):
    print(f'Process {os.getpid()}  rozpoczęto obliczanie elementu {j}{i}')
    suma = 0
    for k in range(i): 
        suma += L[j][k]*U[k][i]
    print(f'Process {os.getpid()}  zakończono obliczanie elementuL {i}{j}')
    return (matrix[j][i] - suma)/U[i][i]
       

def LU(matrix):
#dodać zabezpieczenie przed macierzami niekwadratowymi
    size = len(matrix)
    L = [[0 for col in range(size)] for row in range(size)] 
    for i in range(size):
        L[i][i] = 1
    U = [[0 for col in range(size)] for row in range(size)]
    if size == 1:
        L[0][0] = 1
        U[0][0] = matrix[0][0]
        return (L, U)
    else:
        for i in range(size): 
             pU = multiprocessing.Pool()
             j = list(range(i,size))
             U[i] = pU.map(WyznaczElementU(L,U,matrix,i,j),j)
             pL = multiprocessing.Pool()
             j = list(range(i+1,size))
             columnL = pL.map(WyznaczElementU(L,U,matrix,i,j),j)
             for k in range(size - i - 1):
                 L[k + i + 1][i] = columnL[k]
    return(L,U)
"""          
            for j in range(i,size):
                q1 = multiprocessing.Queue()
                p1 = multiprocessing.Process(target=WyznaczElementU, args=(L,U,matrix,i,j,q1,))
                p1.start()
                U[i][j] = q1.get()
            for j in range(i+1,size):
                q2 = multiprocessing.Queue()
                p2 = multiprocessing.Process(target=WyznaczElementL, args=(L,U,matrix,i,j,q2,))
                p2.start()
                L[j][i] = q2.get()
"""
    
    
    
if __name__ == '__main__':    
    matrix = [[5, 3, 2],[1, 2, 0], [3, 0, 4]]
#    matrix = [[1,2],[1,3]]
    L,U = LU(matrix)
    print(WyznacznikMacierzy(matrix))

