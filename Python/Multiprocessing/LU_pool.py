# -*- coding: utf-8 -*-
"""
Created on Tue Jun 26 18:41:59 2018

Funkcja dokonująca rozkładu macierzy na lewo: L i prawostroną: U
Argumentem funkcji jest dowolna macierz kwadratowa
Funkcja zwraca dwie macierze: L i U w podanej kolejnosci


@author: Marcin Nasilowski
"""

import multiprocessing as mp
import time
import numpy



def WyznacznikMacierzy(matrix):
    L,U = LU(matrix)
    det = 1
    print(L)
    size = len(matrix)
    for i in range(size):
        det = 1
    return det


def WyznaczElementU(L,U,matrix,i,j):
    suma = 0
    for k in range(i):
        suma += L[i][k]*U[k][j]
    return {'value': matrix[i][j] - suma,'row': i, 'col': j}


def WyznaczElementL(L,U,matrix,i,j,a):
    suma = 0
    for k in range(i):
        suma += L[j][k]*U[k][i]
    if(U[i][i] != 0):
        return {'value': (matrix[j][i] - suma)/U[i][i], 'row': j, 'col': i}
    else:
        return {'value': 0, 'row': j, 'col': i}



def LU(matrix):
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
# przekształcamy macierz pierwotną
        detSign = 1
        for j in range(size):
            maxi = j
            maxValue = abs(matrix[j][j])
            change = 1
            for i in range(j,size):
                if(abs(matrix[i][j]) > maxValue):
                    maxValue = abs(matrix[i][j])
                    maxi = i
                    change = -1
            if(change == -1):
                pom = matrix[j]
                matrix[j] = matrix[maxi]
                matrix[maxi] = pom
            detSign *= change
# wyznaczanie macierzy LiU
        for i in range(size):
            pool = mp.Pool()
            results = []
            for j in range(i,size):
                results.append(pool.apply_async(WyznaczElementU,args=(L,U,matrix,i,j)))
            pool.close()
            pool.join()
            results = [r.get() for r in results]
            for j in range(0,size-i):
                U[results[j]['row']][results[j]['col']] = results[j]['value']
            pool = mp.Pool()
            results = []
            for j in range(i  + 1,size):
                 results.append(pool.apply_async(WyznaczElementU,args=(L,U,matrix,i,j)))
            pool.close()
            pool.join()
            results = [r.get() for r in results]
            for j in range(0,size-i-1):
                L[results[j]['row']][results[j]['col']] = results[j]['value']
        return (L, U)


if __name__ == '__main__':

#    matrix = [[0, 6, -2, -1, 5],[0, 0, 0, -9, -7], [0, 15, 35, 0, 0], [0 ,-1, -11, -2, 1], [-2, -2, 3, 0, -2]]
#    matrix = [[5, 3, 2],[1, 2, 0], [3, 0, 4]]
    matrix  = numpy.random.rand(100,100)
    time_start = time.time()
    print(WyznacznikMacierzy(matrix))
    print('czas wykonania mojego skryptu', time.time() - time_start)
#    matrix = [[0, 6, -2, -1, 5],[0, 0, 0, -9, -7], [0, 15, 35, 0, 0], [0 ,-1, -11, -2, 1], [-2, -2, 3, 0, -2]]
    matrix  = numpy.random.rand(10,10)
    time_start = time.time()
    print(numpy.linalg.det(matrix))
    print('czas wykonania mojego skryptu numpy', time.time() - time_start)
