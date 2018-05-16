#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

# name = input('请输入你的姓名：')
# print('Hello, %s' %(name))
# import math
# def my_abs(x):
#     if not isinstance(x, (int, float)):
#         raise TypeError('bad operand type')
#     if x >= 0:
#         return x
#     else:
#         return -x


# print(my_abs('123e'))

# 空函数
# pass语句什么都不做，那有什么用？实际上pass可以用来作为占位符，
# 比如现在还没想好怎么写函数的代码，就可以先放一个pass，让代码能运行起来。
# def nop():
#     pass
# angle=0用的就是默认偏移量，使得move（）函数调用的时候可以忽略该参数

# def move(x, y, step, angle=0):
#     nx = x + step * math.cos(angle)
#     ny = y - step * math.sin(angle)
#     return nx, ny

# x, y = move(100,500,100,math.pi / 6)
# a = x, y
# print(a)
# 定义默认参数要牢记一点：默认参数必须指向不变对象！ 
# Python允许你在list或tuple前面加一个*号，把list或tuple的元素变成可变参数传进去：
# def calc(*numbers):
#     sum = 0
#     for n in numbers:
#         sum = sum + n * n
#     return sum

# 关键字参数
# 可变参数允许你传入0个或任意个参数，这些可变参数在函数调用时自动组装为一个tuple。
# 而关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict。请看示例：
# def person(name, age, **kw):
#     print('name:', name, 'age:', age, 'other:', kw)
# print(name,age,city='Beijing', addr='Chaoyang', zipcode=123456)
# 这个时候**kw就是关键字参数dict

# 命名关键字参数
# 和关键字参数**kw不同，命名关键字参数需要一个特殊分隔符*，*后面的参数被视为命名关键字参数。
# def person(name, age, city, job):
#     print(name, age, city, job)

# person('123', 24, city = 'Beijing', job = 'Enginear')

# 递归
# def fact(n):
#     if n == 1 :
#         return 1
#     return n * fact(n - 1)
    
# print(fact(1),'\n',fact(5), fact(100))
# 由于递归过多层会导致栈溢出 、所以要用尾递归优化
# def fact(n):
#     return fact_iter(n, 1)

# def fact_iter(num, product):
#     if num == 1:
#         return product
#     return fact_iter(num - 1, num * product)

# print(fact(4))
# 遗憾的是，大多数编程语言没有针对尾递归做优化，
# Python解释器也没有做优化，所以，即使把上面的fact(n)函数改成尾递归方式，也会导致栈溢出。

# 切片（Slice）操作符
# L = list(range(100))
# print(L[:10])
# print(L[:10:2])
# print(L[::5])

# def trim(s):
#     if len(s) == 0:
#         return s
#     else:
#         while s[0:1] == ' ':
#             s = s[1:]
#         while s[-1:] == ' ':
#             s = s[:-1]
#         return s
# print(trim(' w '))

#迭代 如果给定一个list或tuple，我们可以通过for循环来遍历这个list或tuple，这种遍历我们称为迭代（Iteration）。
# def findMinAndMax(L):
#     if len(L) == 0:
#         return (None,None)
#     else:
#         max = L[0]
#         min = L[0]
#         for x in L :        
#             if not isinstance(x, (int, float)):
#                 raise TypeError('bad operand type')
#             else:
#                 if x > max:
#                     max = x
#                 if x < min:
#                     min = x
#         return (min,max)
# print(findMinAndMax([1,2,4,5,6,7,8]))

# 列表生成式 
# 写列表生成式时，把要生成的元素x * x放到前面，
# 后面跟for循环，就可以把list创建出来，十分有用，多写几次，很快就可以熟悉这种语法。
# for循环后面还可以加上if判断 一层一层
# 例如，列出当前目录下的所有文件和目录名，可以通过一行代码实现：
# import os
# print([d for d in os.listdir('.')])# os.listdir可以列出文件和目录
# L1 = ['Hello', 'World', 18, 'Apple', None]
# L2 = [s.lower() for s in L1 if isinstance(s,str)]
# print(L2)

# 生成器 如果列表元素可以按照某种算法推算出来，那我们是否可以在循环的过程中不断推算出后续的元素呢？
# 这样就不必创建完整的list，从而节省大量的空间。在Python中，这种一边循环一边计算的机制，称为生成器：generator。
# 要创建一个generator，有很多种方法。第一种方法很简单，只要把一个列表生成式的[]改成()，就创建了
# 斐波那契数列
#  def fib(max):
#     n, a, b = 0, 0, 1
#     while n < max:
#         print(b)
#         a, b = b, a + b
#         n = n + 1
#     return 'done'
# 仔细观察，可以看出，fib函数实际上是定义了斐波拉契数列的推算规则，
# 可以从第一个元素开始，推算出后续任意的元素，这种逻辑其实非常类似generator。
# 也就是说，上面的函数和generator仅一步之遥。要把fib函数变成generator，只需要把print(b)改为yield b就可以了：
# def fib(max):
#     n, a, b = 0, 0, 1
#     while n < max:
#         yield b
#         a, b = b, a + b
#         n = n + 1
#     return 'done'
# 这就是定义generator的另一种方法。如果一个函数定义中包含yield关键字，那么这个函数就不再是一个普通函数，而是一个generator：
# for n in fib(6):
#     print(n)    
# g = fib(5)
# while True: 
#     try:
#         x = next(g)
#         print('fib:',x)
#     except StopIteration as e:
#         print(e.value)
#         break
#杨辉三角
# def triangles():
#     l = [1]
#     while 1:
#         yield l
#         l = [1] + [ l[n] + l[n+1] for n in range(len(l)-1) ]  + [1] 

# n = 0
# results = []
# for t in triangles():
#     print(t)
#     results.append(t)
#     n = n + 1
#     if n == 10:
#         break
# if results == [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1],
#     [1, 7, 21, 35, 35, 21, 7, 1],
#     [1, 8, 28, 56, 70, 56, 28, 8, 1],
#     [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]
# ]:
#     print('测试通过!')
# else:
#     print('测试失败!')

# 迭代器 这些可以直接作用于for循环的对象统称为可迭代对象：Iterable。
# 可以被next()函数调用并不断返回下一个值的对象称为迭代器：Iterator。-->表示一个数据流

#高阶函数 编写高阶函数，就是让函数的参数能够接收别的函数。
# def add(x, y, f):
#     return f(x) + f(y)

# print(add(-5, 6, abs))

# map/reduce
# map()函数接收两个参数，一个是函数，一个是Iterable，map将传入的函数依次作用到序列的每个元素，并把结果作为新的Iterator返回。
# def f(x):
#     return x * x

# r = map(f,[1,2,3,4,5,6,7,8,9])
# print(list(r))
# reduce
# 再看reduce的用法。reduce把一个函数作用在一个序列[x1, x2, x3, ...]上，
# 这个函数必须接收两个参数，reduce把结果继续和序列的下一个元素做累积计算，其效果就是：

# from functools import reduce
# def add(x, y):
#     return x + y
# print(reduce(add, [1,3,5,7]))

# filter 过滤算法
# Python内建的filter()函数用于过滤序列。和map()类似
# filter()也接收一个函数和一个序列。和map()不同的是，filter()把传入的函数依次作用于每个元素，
# 然后根据返回值是True还是False决定保留还是丢弃该元素。
# def is_odd(n):
#     return n % 2 == 1

# print(list(filter((is_odd),[1,2,3,4,5,6,7,8,9,15])))

# sorted 排序算法 
# sroted()是一个高阶函数，可以接收一个key函数来自定义排序 

# g = sorted([36, 5, -12, 9, -21])
# f = sorted([36, 5, -12, 9, -21], key=abs)
# print(g)
# print(f)
# # 若要进行反向排序，不必改动key函数，可以传入第三个参数reverse=True：
# r = sorted([36, 5, -12, 9, -21], key=abs,reverse=True)
# print(r)
# L = [('Bob', 75), ('Adam', 92), ('Bart', 66), ('Lisa', 88)]
# def by_name(t):
#     return t[0].lower()
# def by_score(t):
#     return t[1]
# f = sorted(L,key=by_name)
# print(f)
# s = sorted(L,key=by_score)
# print(s)

#返回函数
# def lazy_sum(*args):
#     def sum():
#         ax = 0
#         for n in args:
#             ax = ax + n
#         return ax
#     return sum
# f = lazy_sum(1, 3, 5, 7, 9)

# print(f())

# def createCounter(): 
#     j = 0 
#     n = [j] 
#     def counter(): 
#         n[0] +=1 
#         return n[0] 
#     return counter

# counterA = createCounter()
# print(counterA(), counterA(), counterA(), counterA(), counterA()) # 1 2 3 4 5
# counterB = createCounter()
# if [counterB(), counterB(), counterB(), counterB()] == [1, 2, 3, 4]:
#     print('测试通过!')
# else:
#     print('测试失败!')

# 匿名函数
# 当我们在传入函数时，有些时候，不需要显式地定义函数，直接传入匿名函数更方便。
# L = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# print(map(lambda x: x*x, L))
# 匿名函数lambad x: x*x 等价于 def f(x) return x * x
# 匿名函数有个限制，就是只能有一个表达式
# 同样，也可以把匿名函数作为返回值返回，比如：
# def build(x, y):
    # return lambda: x * x + y * y
# print(build(1,2))

# 装饰器
# 假设我们要增强now()函数的功能，比如，在函数调用前后自动打印日志，
# 但又不希望修改now()函数的定义，这种在代码运行期间动态增加功能的方式，
# 称之为“装饰器”（Decorator）
# decorator就是一个返回函数的高阶函数。所以，我们要定义一个能打印日志的decorator
# def now ():
#     print('2015-3-25')
# f = now
# print(now.__name__)
# print(f.__name__)

# def log(func):
#     def wrapper(*args, **kw):
#         print('call %s():' % func.__name__)
#         return func(*args, **kw)
#     return wrapper
# # 把@log放到nowe()函数的定义处，相当于执行了语句：now = log(now)
# @log
# def nowe():
#     print('2015-3-25')

# nowe()

# 偏函数 
# functools.partial就是帮助我们创建一个偏函数的，不需要我们自己定义int2()，可以直接使用下面的代码创建一个新的函数int2：
# import functools
# int2 = functools.partial(int,base = 2)
# int2('1000')
# 最后，创建偏函数时，实际上可以接收函数对象、*args和**kw这3个参数
# 当函数的参数个数太多，需要简化时，使用functools.partial可以创建一个新的函数，
# 这个新函数可以固定住原函数的部分参数，从而在调用时更简单。

# 模块
# sys模块有一个argv变量，用list存储了命令行的所有参数。argv至少有一个元素，因为第一个参数永远是该.py文件的名称
# import sys

# def test():
#     args = sys.argv
#     if len(args)==1:
#         print('Hello, world!')
#     elif len(args)==2:
#         print('Hello, %s!' % args[1])
#     else:
#         print('Too many arguments!')

# if __name__=='__main__':
#     test()

# 作用域
# 在一个模块中，我们可能会定义很多函数和变量，但有的函数和变量我们希望给别人使用，
# 有的函数和变量我们希望仅仅在模块内部使用。在Python中，是通过_前缀来实现的。
# 类似_xxx和__xxx这样的函数或变量就是非公开的（private），不应该被直接引用，比如_abc，__abc等；
# def _private_1(name):
#     return 'Hello, %s' % name

# def _private_2(name):
#     return 'Hi, %s' % name

# def greeting(name):
#     if len(name) > 3:
#         return _private_1(name)
#     else:
#         return _private_2(name)

# 如果要让内部属性不被外部访问，可以把属性的名称前加上两个下划线__，在Python中
# 实例的变量名如果以__开头，就变成了一个私有变量（private），只有内部可以访问，外部不能访问，所以，我们把Student类改一改
# class Student(object):
#     def __init__(self,name,age,*gender):
#         self.__name = name
#         self.__age = age
#         self.__gender = gender

#     def print_score(self):
#         print('%s: %s' % (self.__name, self.__age))
    
#     def get_gender(self):
#         return self.__gender
#     def set_gender(self,gender):
#         self.__gender = gender

# bart = Student('23',123)
# bart.print_score()
# bart.set_gender(100)
# bart.get_gender()
# print(dir(bart.get_gender))


# 获取对象信息
# 类似__xxx__的属性和方法在Python中都是有特殊用途的，比如__len__方法返回长度。在Python中，
# 如果你调用len()函数试图获取一个对象的长度，实际上，在len()函数内部，
# 它自动去调用该对象的__len__()方法，所以，下面的代码是等价的：
# len('dd')
# 'dd'.__len__()
# 同理，我们可以自定义自己的类的len的方法来调用

# 仅仅把属性和方法列出来是不够的，配合getattr()、setattr()以及hasattr()，我们可以直接操作一个对象的状态：
# class Hast(object):
#     def __init__(self):
#         self.x = 9

#     def power(self):
#         return self.x * self.x

# obj = Hast()

# print(hasattr(obj,'y'))
# setattr(obj,'y',13)
# print(hasattr(obj,'y'))

#实例属性和类属性
# class Student(object):
#      name = 'Student'

#  s = Student() # 创建实例s
#  print(s.name) # 打印name属性，因为实例并没有name属性，所以会继续查找class的name属性
# # Student
# print(Student.name) # 打印类的name属性
# # Student
# s.name = 'Michael' # 给实例绑定name属性
# print(s.name) # 由于实例属性优先级比类属性高，因此，它会屏蔽掉类的name属性
# # Michael
# print(Student.name) # 但是类属性并未消失，用Student.name仍然可以访问
# # Student
# del s.name # 如果删除实例的name属性
# print(s.name) # 再次调用s.name，由于实例的name属性没有找到，类的name属性就显示出来了
# # Student

# 使用__slotos__  限制实例的属性
# class Student(object):
#     __slots__ = ('name', 'age')

# s = Student()
# s.name = 'abc'
# s.age =100
# # 使用__slots__要注意，__slots__定义的属性仅对当前类实例起作用，对继承的子类是不起作用的：
# class GraduateStudent(Student):
#     pass

# g = GraduateStudent()
# g.score = 99
# # 给实例绑定方法：
# def set_age(self,age):
#     self.age = age

# from types import MethodType
# g.set_age = MethodType(set_age, g) # 给实例绑定一个方法
# g.set_age(25)

# #使用@property装饰器
# class Student(object):
#     @property
#     def score(self):
#         return self._score

#     @score.setter
#     def score(self, value):
#         if not isinstance(value, int):
#             raise ValueError('score must be an integer!')
#         if value < 0 or value > 100:
#             raise ValueError('score must between 0 ~ 100!')
#         self._score = value
# # @property的实现比较复杂，我们先考察如何使用。把一个getter方法变成属性，只需要加上@property就可以了，
# # 此时，@property本身又创建了另一个装饰器@score.setter，负责把一个setter方法变成属性赋值，
# # 于是，我们就拥有一个可控的属性操作：
# s = Student()
# s.score = 9999
# print(s.score)
#练习
# class Screen(object):
#     @property
#     def width(self):
#         return self._width
#     @width.setter
#     def width(self, value):
#         if isinstance(value, int):
#             self._width = value
#         else:
#             raise ValueError('数据类型错误,宽度应该为数字')

#     @property
#     def height(self):
#         return self._height
#     @height.setter
#     def height(self, value):
#         if isinstance(value, int):
#             self._height = value
#         else:
#             raise ValueError('数据类型错误,高度应该为数字')
#     @property
#     def resolution(self):
#         return self.width * self.height
# # 测试:
# s = Screen()
# s.width = 1024
# s.height = 768
# print('resolution =', s.resolution)
# if s.resolution == 786432:
#     print('测试通过!')
# else:
#     print('测试失败!')

# 定制类

# 直接显示变量调用的不是__str__()，而是__repr__()，
# 两者的区别是__str__()返回用户看到的字符串，
# 而__repr__()返回程序开发者看到的字符串，也就是说，__repr__()是为调试服务的。
# class Student(object):
#     def __init__(self, name):
#         self.name = name
#     def __str__(self):
#         return 'Student object (name=%s)' % self.name
#     __repr__ = __str__

# __iter__  __next__
# 如果一个类想被用于for ... in循环，类似list或tuple那样，就必须实现一个__iter__()方法，该方法返回一个迭代对象，
# 然后，Python的for循环就会不断调用该迭代对象的__next__()方法拿到循环的下一个值，直到遇到StopIteration错误时退出循环。
# class Fib(object):
#     def __init__(self):
#         self.a, self.b = 0, 1 # 初始化两个计数器a，b

#     def __iter__(self):
#         return self # 实例本身就是迭代对象，故返回自己

#     def __next__(self):
#         self.a, self.b = self.b, self.a + self.b # 计算下一个值
#         if self.a > 100000: # 退出循环的条件
#             raise StopIteration()
#         return self.a # 返回下一个值
# for n in Fib():
#     print(n)

# __getitem__  让类可以像list 那样取下标
# class Fib(object):
#     def __getitem__(self, n):
#         a, b = 1, 1
#         for x in range(n):
#             a, b = b, a + b
#         return a
# f = Fib()
# f[0]
# 对于Fib却报错。原因是__getitem__()传入的参数可能是一个int，也可能是一个切片对象slice，所以要做判断：
# class Fib(object):
#     def __getitem__(self, n):
#         if isinstance(n, int): # n是索引
#             a, b = 1, 1
#             for x in range(n):
#                 a, b = b, a + b
#             return a
#         if isinstance(n, slice): # n是切片
#             start = n.start
#             stop = n.stop
#             if start is None:
#                 start = 0
#             a, b = 1, 1
#             L = []
#             for x in range(stop):
#                 if x >= start:
#                     L.append(a)
#                 a, b = b, a + b
#             return L

# f = Fib()
# print(f[0:5])

# __getattr__ 避滑用，当取不到类的属性时会从此方法寻找是否有值可以返回。
# class Student(object):

#     def __init__(self):
#         self.name = 'Michael'

#     def __getattr__(self, attr):
#         if attr=='score':
#             return 99
# s = Student()
# s.name 
# s.score

# class Chain(object):

#     def __init__(self, path=''):
#         self._path = path

#     def __getattr__(self, path):
#         return Chain('%s/%s' % (self._path, path))
    
#     def user(self, user):
#         self._path +='/' + user
#         return self

#     def __str__(self):
#         return self._path
#     __repr__ = __str__
# print(Chain().status.users.timeline.list)
# print(Chain().saatus.user('ddd').ppp)

# #  __call__ 让实例可以调用实例本身
# class Student(object):
#     def __init__(self, name):
#         self.name = name

#     def __call__(self):
#         print('My name is %s.' % self.name)

# s = Student('Karo')
# print(s())
# # callable   判断一个对象是否能被调用
# print(callable(Student('n')))
# print(callable([123123]))

# Enum类 用于枚举
# from enum import Enum
# Month = Enum('Month', ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'))

# for name, member in Month.__members__.items():
#     print(name, '=>', member, ',', member.value)

# from enum import Enum, unique

# @unique
# class Weekday(Enum):
#     Sun = 0 # Sun的value被设定为0
#     Mon = 1
#     Tue = 2
#     Wed = 3
#     Thu = 4
#     Fri = 5
#     Sat = 6
# # @unique装饰器 可以保证没有重复值

# day = Weekday.Mon
# print(day.value)


# class Hello(object):
#     def hello(self, name='world'):
#         print('Hello, %s.' % name)
# type()函数既可以返回一个对象的类型，又可以创建出新的类型 动态创建类
# def fn(self, name = 'world'):
#     print('Hello， %s' % name)

# Hello = type('Hello',(object,),dict(hello=fn)) # 创建Hello class
# h = Hello()
# h.hello()

# metaclass  元类 动态创建元类、使类可以定义
# metaclass是累的模板，所以必须从'type'类型派生
# class ListMetaclass(type):
#     def __new__(cls, name, bases, attrs):
#         attrs['add'] = lambda self, value: self.append(value)
#         return type.__new__(cls, name, bases, attrs)

# class MyList(list,metaclass = ListMetaclass):
#     pass

# 当我们传入关键字参数metaclass时，魔术就生效了，它指示Python解释器在创建MyList时，要通过ListMetaclass.__new__()来创建，在此，我们可以修改类的定义，比如，加上新的方法，然后，返回修改后的定义。

# __new__()方法接收到的参数依次是：

#    当前准备创建的类的对象；

#    类的名字；

#    类继承的父类集合；

#    类的方法集合。
# L = MyList()
# L.add()
# print(L)

# ORM全称“Object Relational Mapping”，即对象-关系映射，就是把关系数据库的一行映射为一个对象，
# 也就是一个类对应一个表，这样，写代码更简单，不用直接操作SQL语句。
# 要编写一个ORM框架，所有的类都只能动态定义，因为只有使用者才能根据表的结构定义出对应的类来。

# 编写底层模块的第一步，就是先把调用接口写出来。比如，使用者如果使用这个ORM框架，
# 想定义一个User类来操作对应的数据库表User，我们期待他写出这样的代码：
# class User(Model):
#     # 定义类的属性到列的映射：
#     id = IntegerField('id')
#     name = StringField('username')
#     email = StringField('email')
#     password = StringField('password')

# # 创建一个实例：
# u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
# # 保存到数据库：
# u.save()

# class Field(object):
#     def __init__(self, name, column_type):
#         self.name = name
#         self.column_type = column_type
    
#     def __str__(self):
#         return '<%s:%s>' % (self.__class__.__name__, self.name)

# class StringField(Field):
#     def __init__(self, name):
#         super(StringField, self).__init__(name,'varchar(100)')

# class IntegerField(Field):
#     def __init__(self, name):
#         super(IntegerField, self).__init__(name, 'bigint')

# # Metaclass
# class ModelMetaclass(type):
#     def __new__(cls, name, bases, attrs):
#         if name == 'Model':
#             return type.__new__(cls, name, bases, attrs)
#         print('Found model: %s' % name)
#         mappings = dict()
#         for k, v in attrs.items():
#             if isinstance(v,Field):
#                 print('Found mapping: %s ==> %s' % (k, v))
#                 mappings[k] = v
#         for k in mappings.keys():
#             attrs.pop(k)
#         attrs['__mappings__'] = mappings # 保存属性和列的映射关系
#         attrs['__table__'] = name # 假设表名和类名一致
#         return type.__new__(cls, name, bases, attrs)

# # Model
# class Model(dict, metaclass = ModelMetaclass):
#     def __init__(self, **kw):
#         super(Model, self).__init__(**kw)
    
#     def __getattr__(self, key):
#         try:
#             return self[key]
#         except KeyError:
#             raise AttributeError(r"'Model' object has no attribute '%s'" % key)

#     def __setattr__(self, key, value):
#         self[key] = value

#     def save(self):
#         fields = []
#         params = []
#         args = []
#         for k, v in self.__mappings__.items():
#             fields.append(v.name)
#             params.append('?')
#             args.append(getattr(self, k, None))
#         sql = 'insert into %s (%s) values (%s)' % (self.__table__, fields, params)
#         print('SQL: %s' % sql)
#         print('ARGS: %s' % str(args))

# class User(Model):
#     # 定义类的属性到列的映射：
#     id = IntegerField('id')
#     name = StringField('username')
#     email = StringField('email')
#     password = StringField('password')

# # 创建一个实例：
# u = User(id=12345, name='Michael', email='test@orm.org', password='my-pwd')
# # 保存到数据库：
# u.save()

# 调试 
# 1.断言assert 2.logging 3.pdb 

# 单元测试、文档测试-- 回顾看

# IO编程

# 文件读写 读写文件是最常见的IO操作。Python内置了读写文件的函数，用法和C是兼容的。
# 读写文件前，我们先必须了解一下，在磁盘上读写文件的功能都是由操作系统提供的，现代操作系统不允许普通的程序直接操作磁盘，
# 所以，读写文件就是请求操作系统打开一个文件对象（通常称为文件描述符），
# 然后，通过操作系统提供的接口从这个文件对象中读取数据（读文件），或者把数据写入这个文件对象（写文件）。
# 读
# 关键字'r'是文件类型的标识 读取文本文件，并且是UTF-8编码的文本文件
# 由于文件读写时都有可能产生IOError，
# # 一旦出错，后面的f.close()就不会调用。所以，为了保证无论是否出错都能正确地关闭文件，我们可以使用try ... finally来实现：
# try: 
#     f = open('/Users/alberthuang/Karo/Builder/MVVM/config.json', 'r')
#     print(f.read())
# finally:
#     if f:
        #  f.close()

# # 但是每次都这么写实在太繁琐，所以，Python引入了with语句来自动帮我们调用close()方法：
# with open('/Users/alberthuang/Karo/Builder/MVVM/config.json', 'r') as f:
#     print(f.read())

# # 关键字'rb'可以读取二进制文件 、例如图片、视频等
# f = open('/Users/michael/test.jpg', 'rb')
# f.read()
# b'\xff\xd8\xff\xe1\x00\x18Exif\x00\x00...' # 十六进制表示的字节

# # 要读取非UTF-8编码的文本文件，需要给open()函数传入encoding参数，例如，读取GBK编码的文件：
# f = open('/Users/michael/gbk.txt', 'r', encoding='gbk')
# f.read()
# 遇到有些编码不规范的文件，你可能会遇到UnicodeDecodeError，因为在文本文件中可能夹杂了一些非法编码的字符。
# 遇到这种情况，open()函数还接收一个errors参数，表示如果遇到编码错误后如何处理。最简单的方式是直接忽略：
# f = open('/Users/michael/gbk.txt', 'r', encoding='gbk', errors='ignore')
# 写
# 写文件和读文件是一样的，唯一的区别是调用open()函数时，传入标识符'w'或者'wb'表示写文本文件或写二进制文件：
# 你可以反复调用write()来写入文件，但是务必要调用f.close()来关闭文件。当我们写文件时，操作系统往往不会立刻把数据写入磁盘，
# 而是放到内存缓存起来，空闲的时候再慢慢写入。只有调用close()方法时，操作系统才保证把没有写入的数据全部写入磁盘。
# 忘记调用close()的后果是数据可能只写了一部分到磁盘，剩下的丢失了。所以，还是用with语句来得保险：
# 细心的童鞋会发现，以'w'模式写入文件时，如果文件已存在，会直接覆盖（相当于删掉后新写入一个文件）。
# 如果我们希望追加到文件末尾怎么办？可以传入'a'以追加（append）模式写入。

# 操作文件和目录 内置的os模块。--主要是记住os模块的相应命令。例如常用的mkdir、rmdir等

# 序列化

# 序列化主要还是针对python和json之间的转化


# name = "Karo"

# print("My name is", name)
# # 格式化
# info2 = '''
# --------info of {_name} -----
# Name:{_name}
# '''.format(_name=name)

# print(info2)
# # 密文密码
# _username = "admin"
# _password = "123456"
# username = input("username:")
# password = input("password:")

# if _username == username and _password == password:
#     print("Welcome user {name} login...".format(name = username))
# else:
#     print("Invalid")

# age = 56
# input_age = int(input("age:"))
# count = 0
# while True:
#     print("count",count)
#     count = count + 1
# else:
#     pass





# 装饰器

# 注意装饰的层数
# 生成器
def fib(max):
    n,a,b=0,0,1
    while n<max:
        yield b
        a,b=b,a+b
        n=n+1
    return "越界"


      
g=fib(6)
while True:    
    try:
        print(g.__next__())
    except StopIteration as e:
        print(e.value)
        break