#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'
# 序列化--把内存中的对象转化成字符串。
# 与之对应的必然有反序列化-
# import json
import pickle 
def sayhi(name):
    print("hello,",name)

info = {
    'name':'alex',
    'age':22,
    'func':sayhi
 }
f=open("test.text","wb")

# f.write(json.dumps(info))
f.write(pickle.dumps(info))
f.close