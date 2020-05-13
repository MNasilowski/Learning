# -*- coding: utf-8 -*-
"""
Created on Fri Mar  6 16:56:55 2020

@author: nasil
"""
#    diferences = [abs(sum(A[:P]) - sum(A[P:])) for P in range(1,len(A))]
#    return min(diferences)
def peaks_positions(A):
    peaks = [i for i in range(len(A)-1) if A[i-1]<A[i]>A[i+1]]
    return peaks

def we_can_split(A, peaks, k):
    #firs
    if len(A)%k != 0:
        return False
    if len(peaks)%k != 0:
        return False     
    return True

def equal_nr_of_peaks_in_parts(A, peaks, k):
    step_A = int(len(A)/k)
    step_peaks = int(len(peaks)/k)
    
    for i in range(k):
        begining_A =i * step_A
        ending_A = begining_A + step_A
        first_peak = peaks[i*step_peaks]
        last_peak = peaks[(i+1)*step_peaks-1]
        print("A",A[begining_A:ending_A])
        print("P",peaks[i*step_peaks:(i+1)*step_peaks])
        if begining_A <= first_peak or  last_peak >= ending_A:
            return False
    return True

def solution(A):
    peaks = peaks_positions(A)
    nr_of_peaks = len(peaks)
    for parts in reversed(range(1,nr_of_peaks+1)):
        if we_can_split(A,peaks,parts):
            if equal_nr_of_peaks_in_parts(A,peaks,parts):
                return parts
    return 0
            

            

            
        
        


N = [1,5,3,4,3,4,1,2,3,4,6,2]
N2 = [1,2,1,1,2,1]
N3 = [4,3,2,1]
N4 = [1,2,1,1,2,1,1,2,1,1,2,1]
print(solution(N))
#print(solution(N2))
#print(solution(N3))
#print(solution(N4))
