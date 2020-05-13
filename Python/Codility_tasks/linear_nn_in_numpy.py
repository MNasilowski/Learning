# -*- coding: utf-8 -*-
"""
Created on Fri Mar 20 10:50:37 2020

@author: nasil
"""
import numpy as np

class Warstwa:
    
    def __init__(self, input_vector, output_size):
        self.output_size = output_size
        self.input_size = input_vector.size
        self.output = np.zeros(output_size)
        self.input = input_vector
        self.W = np.random.rand(self.input_size,output_size)
    
    def forward(self,input):
        self.output = np.transpose(self.input).dot(self.W)
        return self.output
    
class Siec:
    layers = []
    def __init__(self):
        pass
    
    
    
    
        
if __name__ == "__main__":
    X = np.array([1,1,1,1,1])
    warstwa_1 = Warstwa(X,2)
    print(warstwa_1.W)
    print(warstwa_1.forward(X))