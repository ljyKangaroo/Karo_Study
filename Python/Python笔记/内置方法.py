#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

# 绝对值
abs(-5)  
# 使用对象iterable 作用，可迭代对象里面有空值或零时返回False
print(all([0,-5,3]))
# 使用对象iterable 作用，可迭代对象里面有值时返回True
print(any([0,0,0,3]))
# ascii码：把内存对象转化为可打印的字符串的形式
a = ascii([1,2,"挂"])
print(type(a),a)
# bin: 使用对象：数字 作用：十进制转二进制
print(bin(10))
# callable: 判断是否可调用，函数，类等形式
def testCallable():
    pass
print(callable(testCallable))
# chr: 输出ascii码对应的值 对应的相反方法
# ord（‘d’）
print(chr(100),ord('d'))
# clssmethod: fuction
# compile 把字符串转化为可执行的对象
# py_obj = compile(code,"err,log","exec")
# exec(py_obj)
# dir: 看方法
a={}
print(dir(a))
# divmod：求余和商
print(divmod(5,3))
# eval exec 执行用  
# 匿名函数 用完就释放 只能写三元运算。
# 通常是结合使用
(lambda n:print(n))(5)
calc = lambda n:print(n)
calc(5)
# filter：根据规则过滤改变
res = filter(lambda n:n>5,range(10))
for i in res:
    print(i)
# map： 根据规则整体改变
mapRes = map(lambda n:n*2,range(10))
for i in mapRes:
    print(i)
# reduce：根据规则累计 3.0已移至标准库functools中 
import functools
res = functools.reduce(lambda x,y:x+y,range(10))
print(res)
# frozenset： 不可变的set
f=frozenset([1,2,3,445,5431,3425,345,5])
# globals: 返回程序文件的值
# print(globals())
# hash： 哈希 散列 返回对应的唯一值，极小几率会重复。
# 原理
print(hash('alex'))
# hex: 十进制转化为十六进制
print(hex(100))
# oct: 十进制转八进制
print(hex(8))
# pow: 次方
print(pow(3,2))
# round  保留位数，只舎不入
print(round(1.335,2))
# dict
a={6:2,8:0,1:4,-5:6,99:11}
sorted(a)
print(a)
# type 判断数据类型 

# zip 结合两个数组。

a = [1,2,3,4]
b = ['a','b','c','d']

for i in zip(a,b):
    print(i)
# __import__() 


