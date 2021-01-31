# -*- coding: utf-8 -*-
"""
Created on Fri Nov 27 19:47:29 2020

@author: nasil
"""

import os
cwd = os.getcwd()
file = "C:\\Users\\nasil\\Desktop\\CV\\Python\\ThinkPython"
def walk(dirname = cwd):
    for name in os.listdir(dirname):
        path = os.path.join(dirname, name)
        if os.path.isfile(path):
            print(path)
        else:
            walk(path)
            

def sed(old, new, input_file, output_file):
    try:
        with open(input_file,"r") as f_in:
            with open(output_file,"w") as f_out:
                for line in f_in:
                    f_out.write(line.replace(old,new))
        return 1
    except:
        print("Yo Mother Father something goes wrong check if file exist")
        return 0

    
    
sed("kot","pies","old_text.txt","new_text.txt")