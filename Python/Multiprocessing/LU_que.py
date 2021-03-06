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
import time
import numpy



def WyznacznikMacierzy(matrix):
    if len(matrix) != len(matrix[0]):
        raise ValueError
    try:
        L,U,detSign = LU(matrix)
    except ZeroDivisionError as e:
        raise ValueError
    det = 1
    size = len(matrix)
    for i in range(size):
        det *= U[i][i]
    return det*detSign


def WyznaczElementU(L,U,matrix,i,j,a):
    suma = 0
    for k in range(i):
        suma += L[i][k]*U[k][j]
    a.put({'value': matrix[i][j] - suma,'row': i, 'col': j})
    return 1

def WyznaczElementL(L,U,matrix,i,j,a):
    suma = 0
    for k in range(i):
        suma += L[j][k]*U[k][i]
    a.put({'value': (matrix[j][i] - suma)/U[i][i], 'row': j, 'col': i})
    return 1


def LU(matrix):
    if len(matrix) != len(matrix[0]):
        raise ValueError
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
            q1 = mp.Queue()
            processes = [mp.Process(target=WyznaczElementU, args=(L,U,matrix,i,j,q1)) for j in range(i,size)]
            time_start = time.time()
            for p in processes:
                p.start()
            print('start procesow',i,time.time() - time_start)
            time_start = time.time()
            for p in processes:
                p.join()
            print('join procesow',i,time.time() - time_start)
            time_start = time.time()
            results = [q1.get() for p in processes]
            for j in range(0,size-i):
                U[results[j]['row']][results[j]['col']] = results[j]['value']
            q2 = mp.Queue()
            processes = [mp.Process(target=WyznaczElementL, args=(L,U,matrix,i,j,q2)) for j in range(i+1,size)]
            for p in processes:
                p.start()
            for p in processes:
                p.join()
            results = [q2.get()for p in processes]
            for j in range(0,size-i-1):
                L[results[j]['row']][results[j]['col']] = results[j]['value']
        return (L, U, detSign)


if __name__ == '__main__':

#    matrix = [[0, 6, -2, -1, 5],[0, 0, 0, -9, -7], [0, 15, 35, 0, 0], [0 ,-1, -11, -2, 1], [-2, -2, 3, 0, -2]]
#    matrix = [[5, 3, 2],[1, 2, 0], [3, 0, 4]]
    matrix  = numpy.random.rand(10,10)
    time_start = time.time()
    print(WyznacznikMacierzy(matrix))
    print('czas wykonania mojego skryptu', time.time() - time_start)
#    matrix = [[0, 6, -2, -1, 5],[0, 0, 0, -9, -7], [0, 15, 35, 0, 0], [0 ,-1, -11, -2, 1], [-2, -2, 3, 0, -2]]
    matrix  = numpy.random.rand(10,10)
    time_start = time.time()
    print(numpy.linalg.det(matrix))
    print('czas wykonania mojego skryptu numpy', time.time() - time_start)
