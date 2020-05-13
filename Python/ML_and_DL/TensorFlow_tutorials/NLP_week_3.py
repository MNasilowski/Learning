# -*- coding: utf-8 -*-
"""
Created on Tue Dec 10 16:14:07 2019

@author: nasil
"""

import json
import tensorflow as tf
import csv
import random
import numpy as np

from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.utils import to_categorical
from tensorflow.keras import regularizers

embedding_dim = 100
max_length = 16
trunc_type = 'post'
padding_type = 'post'
oov_tok = "<OOV>"
training_size = 160000
test_portion= 0.1

print(tf.__version__)


num_sentences = 0
corpus = []

with open("training_cleaned.csv") as csvfile:
    reader = csv.reader(csvfile, delimiter = ',')
    for row in reader:
        list_item = []
        list_item.append((row[5],row[0]))
        num_sentences = num_sentences + 1
        corpus.append(list_item)