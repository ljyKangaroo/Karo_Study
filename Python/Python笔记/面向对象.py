#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

# 类的继承
class People(object):
    def __init__(self,name,age):
        self.name = name
        self.age = age

    def eat(self):
        print("%s is eating" % self.name)

# 多继承
class Relation(object):
    def make_friends(self,obj):
        print("%s is making friends with %s" % (self.name,obj.name))
        
class Man(People, Relation):
    def __init__(self,name,age,money):
        People.__init__(self,name,age)
        self.money = money 
    # 重写
    '''
    def eat(self):
        pass
    '''
    # 重构
    def eat(self):
        super(Man,self).eat()#新式类写法
        print("Man")

class Woman(People, Relation):
    def get_birth(self):
        print("%s is born a baby..." % self.name)

m1 = Man("good man" , 12,198111)
m1.eat()

w1 = Woman("good woman", 20)
w1.get_birth()

m1.make_friends(w1)

# 多继承概念性思维   
# 深度优先 先找上级、再找同级
# 广度优先 先找同级、再找上级
# python2经典类是深度优先，新式类是广度优先
# python3全都是广度优先

# 多态 
# 一种接口，多种实现
