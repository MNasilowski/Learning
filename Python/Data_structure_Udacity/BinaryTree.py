# -*- coding: utf-8 -*-
"""
Created on Wed Mar 20 15:00:08 2019

@author: nasil
"""

class Node(object):
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

class BinaryTree(object):
    def __init__(self, root):
        self.root = Node(root)

    def search(self, find_val):
        """Return True if the value
        is in the tree, return
        False otherwise."""
        if self.root.value == find_val:
            return True
        else:
            if self.root.left != None:
                leftTree = BinaryTree(tree.root.left.value)
                leftTree.root = tree.root.left
                if leftTree.search(find_val): return True
            return False
        return False
        
            

    def print_tree(self):
        """Print out all tree nodes
        as they are visited in
        a pre-order traversal."""
        return ""

    def preorder_search(self, start, find_val):
        """Helper method - use this to create a 
        recursive search solution."""
        return False

    def preorder_print(self, start, traversal):
        """Helper method - use this to create a 
        recursive print solution."""
        return traversal


# Set up tree
tree = BinaryTree(1)
tree.root.left = Node(2)
tree.root.right = Node(3)
tree.root.left.left = Node(4)
tree.root.left.right = Node(5)

print(tree.root.value)
print(tree.root.left.value)
print(tree.root.right.value)


leftTree = BinaryTree(tree.root.left.value)
leftTree.root = tree.root.left
print(leftTree.root.left.value)


# Test search
# Should be True
print(tree.search(4))
# Should be False
#print(tree.search(6))

# Test print_tree
# Should be 1-2-4-5-3
#print(tree.print_tree())