# -*- coding: utf-8 -*-
"""
Created on Fri Jan 18 14:19:54 2019

@author: MNasilowski
"""

#Przygotowanie warstw

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
import numpy as np
import pandas as pd
#import matplotlib.pyplot as plt


#Parametry sieci
image_size = (128,128)
batch_size = 32
#dropout = 0.5

#Przygotowujemy warstwę wejsiowa

classifier = Sequential()

#Pierwsza warstwa
classifier.add(Conv2D(128, (3, 3), input_shape=(*image_size, 3), padding = 'same'))
classifier.add(BatchNormalization())
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size = (2,2)))

#Druga warstwa conwolucyjna
classifier.add(Conv2D(64, (3, 3), padding = 'same'))
classifier.add(BatchNormalization())
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size = (2,2)))

#Trzecia warstwa conwolucyjna
classifier.add(Conv2D(32, (3, 3), padding = 'same'))
classifier.add(BatchNormalization())
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size = (2,2)))

#Trzecia warstwa conwolucyjna
classifier.add(Conv2D(32, (3, 3), padding = 'same'))
classifier.add(BatchNormalization())
classifier.add(Activation('relu'))
classifier.add(MaxPooling2D(pool_size = (2,2)))


#Splaszczamy architekture
classifier.add(Flatten())

#Dodajemy warstwy ukryte
classifier.add(Dense(output_dim = 64, activation = 'relu'))
classifier.add(Dropout(0.5))
classifier.add(Dense(output_dim = 64, activation = 'relu'))
classifier.add(Dense(output_dim = 64, activation = 'relu'))
classifier.add(Dropout(0.25))
classifier.add(Dense(output_dim = 64, activation = 'relu'))
classifier.add(Dense(output_dim = 1, activation = 'sigmoid'))

#
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# 2 Przygotowujemy dane wejsciowe

train_datagen = ImageDataGenerator(
        rescale = 1./255,
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True)

test_datagen = ImageDataGenerator(rescale= 1./255)

training_set = train_datagen.flow_from_directory(
        'dataset/training_set',
        target_size=image_size,
        batch_size = batch_size,
        class_mode = 'binary')

test_set = test_datagen.flow_from_directory(
        'dataset/test_set',
        target_size = image_size,
        batch_size = batch_size,
        class_mode='binary')
history = History()
classifier.fit_generator(
        training_set,
        steps_per_epoch = 20000/batch_size, 
        epochs = 5,
        validation_data = test_set,
        validation_steps = 5000/batch_size,
        callbacks=[history]
        )


classifier.save('DogsVsCats_F_GPU.h5')
#del classifier
#classifier = load_model('DogsVsCatsV1.h5')


A = history.history
df = pd.DataFrame(A)
pd.DataFrame.to_csv(df,'Validation.csv')

#plt.scatter(df.index.values, df['acc'],c = 'b', label = 'acc') 
#plt.scatter(df.index.values, df['val_acc'],c = 'r', label = 'val_acc')
#plt.legend(loc = 'lower right')
#plt.show

#plt.scatter(df.index.values, df['loss'],c = 'b', label = 'loss') 
#plt.scatter(df.index.values, df['val_loss'],c = 'r', label = 'val_loss')
#plt.legend(loc = 'uper right')
#plt.show