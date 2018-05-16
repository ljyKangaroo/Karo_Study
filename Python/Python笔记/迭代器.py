#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

# 概念：
# 可以直接作用于for循环的对象统称为可迭代对象（可循环对象）
# isinstance()判断类型用。Iterable（可迭代对象）
from collections import Iterable
from collections import Iterator
print(isinstance([],Iterable))

# * 可以被next函数调用并不断返回下一个值的对象成为迭代器：Iterator（迭代器）

# 可迭代对象转化为迭代器可使用：iter()函数
a = [1,2,3]
b = iter(a)
print(isinstance(b, Iterator))
print(b.__next__())

# 迭代器使用时机
#                                                                                                              

