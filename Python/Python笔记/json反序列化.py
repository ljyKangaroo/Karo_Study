#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'
# import json
import pickle

def sayhi(name):
    print("hello2,",name)

f = open("test.text","rb")

data = f.read()
f.close()

# tmpDict=eval(data)
# tmpDict = json.loads(data)
tmpDict = pickle.loads(data)
print(tmpDict)
tmpDict["func"]("K")