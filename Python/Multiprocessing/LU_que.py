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
import multiprocessing as mp
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
def WyznaczElementU(L,U,matrix,i,j,a):
    print(f'Process {os.getpid()}  rozpoczęto obliczanie elementu {i}{j}')
    suma = 0
    for k in range(i):
        suma += L[i][k]*U[k][j]
    a.put(matrix[i][j] - suma)
    print(f'Process {os.getpid()}  zakonczono obliczanie elementuU {i}{j}')
    return 1

def WyznaczElementL(L,U,matrix,i,j,a):
    print(f'Process {os.getpid()}  rozpoczęto obliczanie elementu {j}{i}')
    suma = 0
    for k in range(i): 
        suma += L[j][k]*U[k][i]
    a.put((matrix[j][i] - suma)/U[i][i])
    print(f'Process {os.getpid()}  zakończono obliczanie elementuL {i}{j}')
    return 1
       

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
#Wyznaczamy wiersz macierzy górnotrójkątnej
            q1 = mp.Queue()
            print('Wyznaczamy wiersz: ', i)
            processes = [mp.Process(target=WyznaczElementU, args=(L,U,matrix,i,j,q1)) for j in range(i,size)] 
            for p in processes:
                p.start()
            for p in processes:
                p.join()
            U[i] = [q1.get()for p in processes]
#Wyznaczamy kolumnę macierzy dolnotrójkątnej
            print('Wyznaczamy kolumne: ', i)
            q2 = mp.Queue()
            processes = [mp.Process(target=WyznaczElementL, args=(L,U,matrix,i,j,q2)) for j in range(i+1,size)] 
            for p in processes:
                print('Process',os.getpid())
                p.start()
            for p in processes:
                p.join()
            print('Wstawiamy wyniki do tablicy U')
            results = [q2.get()for p in processes]
            for j in range(i+1,size):
               U[i][j] = results[j - i -1]
            print('poszlo i')
    return (L, U)



    
    
    
if __name__ == '__main__':    
    matrix = [[5, 3, 2],[1, 2, 0], [3, 0, 4]]
#    matrix = [[1,2],[1,3]]
    L,U = LU(matrix)
    print(WyznacznikMacierzy(matrix))

