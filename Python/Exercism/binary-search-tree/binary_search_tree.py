class TreeNode:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

    def __str__(self):
        fmt = 'TreeNode({}, {}, {})'
        return fmt.format(str(self.data), str(self.left), str(self.right))
    def to_list(self):
        a = []
        c = []
        if self.left is not None:
            a = self.left.to_list()
        b = [self.data]
        if self.right is not None:
            c = self.right.to_list()
        return a + b + c
    

class BinarySearchTree:
    def __init__(self, tree_data):
        self.tree = TreeNode(tree_data[0])
        for i in range(1,len(tree_data)):
            position = self.tree
            while True:
                if tree_data[i] <= position.data:
                    if position.left is None:
                        position.left = TreeNode(str(tree_data[i]))
                        break
                    else:
                        position = position.left
                else:
                    if position.right is None:
                        position.right = TreeNode(str(tree_data[i]))
                        break
                    else:
                        position = position.right

    def data(self):
        return self.tree

    def sorted_data(self):
        return self.tree.to_list()