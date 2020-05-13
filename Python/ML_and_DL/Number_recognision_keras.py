# -*- coding: utf-8 -*-
"""
Created on Fri Feb 22 14:42:03 2019

@author: nasil
"""

import keras
from keras.datasets import mnist

from keras.models import Sequential
from keras.models import load_model
from keras.layers import Conv2D
from keras.layers import MaxPooling2D
from keras.layers import Flatten
from keras.layers import Dense
from keras.layers import advanced_activations
from keras.layers import BatchNormalization
from keras.layers import Activation
from keras.layers import Dropout
from keras.callbacks import History
from keras.preprocessing.image import ImageDataGenerator
import keras.utils
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


(X_train, y_train),(X_test, y_test) = mnist.load_data()

y_train = keras.utils.to_categorical(y_train, 10)
y_test = keras.utils.to_categorical(y_test, 10)

input_shape = (1, 28, 28)
batch_size = 32

classifier = Sequential()

#Pierwsza warstwa

classifier.add(Conv2D(64, (3, 3), input_shape=(28,28,1)))
classifier.add(Conv2D(32, (3, 3)))
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size = (2,2)))
classifier.add(Dropout(0.25))

#Splaszczamy architekture
classifier.add(Flatten())

#Dodajemy warstwy ukryte
classifier.add(Dense(output_dim = 64, activation = 'relu'))
classifier.add(Dropout(0.5))
classifier.add(Dense(output_dim = 64, activation = 'relu'))
classifier.add(Dropout(0.2))
classifier.add(Dense(output_dim = 10, activation = 'sigmoid'))
#

classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

