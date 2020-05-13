# -*- coding: utf-8 -*-
"""
Created on Wed Oct 10 11:23:47 2018

@author: nasil
"""
import pandas as pd
from sklearn import svm
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.neighbors import KNeighborsClassifier

"""
#Wczytujemy dane
"""
train = pd.read_csv("train.csv")
y = train.iloc[0:4000,0].values
X = train.iloc[0:4000,1:].values
X[X>0] = 1



"""
Dzielimy na częsc uczaca i sprawdzajaca
"""
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

"""
Wybieramy algorytm uczący
"""

clasifierRT = RandomForestClassifier(n_estimators = 1000, random_state = 0);
clasifierRT.fit(X_train, y_train)
clasifierRT.score(X_test, y_test)

clasifierSVM = svm.SVC()
clasifierSVM.fit(X_train, y_train)
clasifierSVM.score(X_test, y_test)

clasifierKNC = KNeighborsClassifier(4)
clasifierKNC.fit(X_train, y_train)
clasifierKNC.score(X_test, y_test)


y_predict_RT = clasifierRT.predict(X_test)
y_predict_SVM = clasifierSVM.predict(X_test)
y_predict_KNC = clasifierKNC.predict(X_test)

for i in range(500):
    if(y_predict_KNC[i] != y_predict_SVM[i]):
        print(i,y_predict_RT[i], y_predict_SVM[i],y_predict_KNC[i],y_test[i] )




