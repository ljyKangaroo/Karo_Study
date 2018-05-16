#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'
import re
# 计算一个不含括号的最小乘除单元，用split分隔*或/然后计算
def multiply_divide(s):
    ret = float(s.split('*')[0]) * float(s.split('*')[1]) if '*' in s else float(s.split('/')[0]) / float(s.split('/')[1])
    return ret
# 将不含括号的表达式里的乘除先递归计算完

def remove_md(s):
    if '*' not in s and '/' not in s:
        # 没有乘除的话递归结束
        return s
    else:
        # 匹配一个最小乘除单元，调用multiply_divide计算，将结果拼接成一个新的表达式进行递归处理                               　　　　　　　　
        k = re.search(r'-?[\d\.]+[*/]-?[\d\.]+', s).group()
        s = s.replace(k, '+' + str(multiply_divide(k))) if len(re.findall(r'-', k)) == 2 else s.replace(k, str(multiply_divide(k)))
        return remove_md(s)
# 计算没有乘除的表达式，得出最后不包含括号表达式的运算结果
def add_sub(s):
    # 将表达式转换成列表，　　　　　　　　
    l = re.findall('([\d\.]+|-|\+)', s)
    if l[0] == '-':
        # 如果第一个数是负数，对其进行处理                   　　　　　　　　
        l[0] = l[0] + l[1]
        del l[1]
    sum = float(l[0])
    # 循环计算结果
    for i in range(1, len(l), 2):
        if l[i] == '+' and l[i + 1] != '-':
            sum += float(l[i + 1])
        elif l[i] == '+' and l[i + 1] == '-':
            sum -= float(l[i + 2])
        elif l[i] == '-' and l[i + 1] == '-':
            sum += float(l[i + 2])
        elif l[i] == '-' and l[i + 1] != '-':
            sum -= float(l[i + 1])
    return sum
# 计算一个基本的4则运算
def basic_operation(s):
    s = s.replace(' ', '')
    # 调用前面定义的函数，先乘除，后加减
    return add_sub(remove_md(s))
# 计算包含括号的表达式
def calculate(expression):
    # 匹配最里面的括号，如果没有的话，直接进行运算，得出结果 　　　　　　　　　　 
    if not re.search(r'\([^()]+\)', expression):
        return basic_operation(expression)
    # 将匹配到的括号里面的表达式交给basic_operation处理后重新拼接成字符串递归处理
    k = re.search(r'\([^()]+\)', expression).group()
    expression = expression.replace(k, str(basic_operation(k[1:len(k) - 1])))
    return calculate(expression)
 
s = '1 - 2 * ( (60-30 +(-40/5) * (9-2*5/3 + 7 /3*99/4*2998 +10 * 568/14 )) - (-4*3)/ (16-3*2) )'
print('用eval计算出来的值为：{}\n计算器计算出来的值为：{}'.format(eval(s), calculate(s)))