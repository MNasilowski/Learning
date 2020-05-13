# -*- coding: utf-8 -*-
"""
Created on Thu Mar 14 20:46:08 2019

@author: nasil
"""

"""Add a couple methods to our LinkedList class,
and use that to implement a Stack.
You have 4 functions below to fill in:
insert_first, delete_first, push, and pop.
Think about this while you're implementing:
why is it easier to add an "insert_first"
function than just use "append"?"""

class Element(object):
    def __init__(self, value):
        self.value = value
        self.next = None
        
class LinkedList(object):
    def __init__(self, head=None):
        self.head = head
        
    def append(self, new_element):
        current = self.head
        if self.head:
            while current.next:
                current = current.next
            current.next = new_element
        else:
            self.head = new_element

    def insert_first(self, new_element):
        "Insert new element as the head of the LinkedList"
        new_element.next = self.head

    def delete_first(self):
        "Delete the first (head) element in the LinkedList as return it"
        self.head = self.head.next

class Stack(object):
    def __init__(self,top=None):
        self.ll = LinkedList(top)

    def push(self, new_element):
        "Push (add) a new element onto the top of the stack"
        self.ll.append(new_element)

    def pop(self):
        "Pop (remove) the first element off the top of the stack and return it"
        current = self.ll.head
        print("a",current)

        if current == None:
            return None
        if current.next == None:
            result = current
            self.ll = LinkedList(None)
            return result
        
        while True:
            if current.next.next == None:
                result = current.next
                current.next = None;
                return result
            current = current.next
    
# Test cases
# Set up some Elements
e1 = Element(1)
e2 = Element(2)
e3 = Element(3)
e4 = Element(4)

# Start setting up a Stack
stack = Stack(e1)

# Test stack functionality
stack.push(e2)
print(stack.pop())
