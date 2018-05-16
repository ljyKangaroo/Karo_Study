#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

# time 、datatime

# import time

# g = time.gmtime()
# x = time.localtime()

# print(x)
# print(x.tm_year)

# strX = time.strftime("%Y-%m-%d %H:%M:%S",x)
# print(strX)

# tupX = time.strptime(strX,"%Y-%m-%d %H:%M:%S")
# print(tupX)

#时间加减
# import datetime

# random 随机值

'''
import random
#验证码
def randomValue(randomIndex):
    current = random.randrange(0,4)
    tmp = ''
    if current == randomIndex:
        #取字母
        tmp = chr(random.randint(65,90))
    else:
        #取数字
        tmp = str(random.randint(0,9))
    return tmp

checkCode = ''
for i in range(4):
    current = randomValue(i)
    checkCode += current

print(checkCode)
'''
# os IU模块

#shelve 序列化模块（json picker） shelve是对picker的上层封装 yaml

# ConfigParser 配置文件模块 和mysql的配置文件相似

# hashlib 加密模块 代替了MD5和sha模块 
# 提供SHA1 SHA224 SHA256 SHA384 SHA512 MD5算法
'''
import hashlib

m = hashlib.md5()
m.update(b"Hello")
print(m.hexdigest())
s2 = hashlib.sha512()
s2.update(b"Hello")
print(s2.hexdigest())
'''
# hmac 模块  
'''
import hmac

h = hmac.new(b"Karo",b"Hello")
print(h.hexdigest())
'''

# re 模块  正则表达式
import re
 # match search findall split
# res = re.match("K.+","Karo123ddd321")
# print(res)
# sea = re.search("D[a-z]+a","Karo123Ddda321a")
# print(sea)
# fin = re.findall("[0-9]{1,3}","aa1x2a345aa3333")
# print(fin)
# p = re.search("(?P<id>[0-9]{4})","121231245345342").groupdict()
# print(p)

# lit = re.split("[0-9]+","abss123sdfds55dfg1e")
# print(lit)

# subb = re.sub("[0-9]+","l","abc122asdf13gf23",count=2)
# print(subb)
s = "abss123sdfds55dfg1e"
print(s.split(r"[\d\.]"))