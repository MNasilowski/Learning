# -*- coding: utf-8 -*-
"""
Created on Fri Mar 15 18:28:09 2019

@author: nasil
"""

class Queue:
    def __init__(self, head=None):
        self.storage = [head]

    def enqueue(self, new_element):
        # Dodaj na koniec kolejki
        self.storage.append(new_element)

    def peek(self):
        return self.storage[0]
    
    def dequeue(self):
        result = self.storage[0]
        del self.storage[0]
        return result
    
# Setup
q = Queue(1)
q.enqueue(2)
q.enqueue(3)

# Test peek
# Should be 1
print( q.peek())

# Test dequeue
# Should be 1
print( q.dequeue())

# Test enqueue
q.enqueue(4)
# Should be 2
print( q.dequeue())
# Should be 3
print(q.dequeue())
# Should be 4
print(q.dequeue())
q.enqueue(5)
# Should be 5
print(q.peek())
