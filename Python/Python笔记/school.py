#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ' a test module '
# __author__ = 'Karo'

# 
class School(object):

    def __init__(self,name,addr):
        self.name = name
        self.addr = addr
        self.students = []
        self.staffs = []

    def enroll(self,stu_obj):
        print("%s enroll success" % stu_obj.name)
        self.students.append(stu_obj)

    def hire(self,staff_obj):
        print("%s hire success" % staff_obj.name)
        self.staffs.append(staff_obj)
    
class SchoolMember(object):
    def __init__(self, name, age, sex):
        self.name = name
        self.age = age
        self.sex = sex

    def tell(self):
        pass

class Teacher(SchoolMember):
    def __init__(self, name, age, sex ,salary,course):
        super(Teacher,self).__init__(name, age, sex)
        self.salary = salary
        self.course = course

    def tell(self):
        print('''
        --- info Of Teacher:%s ---
        Nmae:%s
        Age:%s
        Sex:%s
        Salary:%s
        Course:%s
        ''' % (self.name, self.name, self.age, self.sex, self.salary, self.course))

    def teach(self):
        print("%s is teaching course [%s]" % (self.name, self.course))
        
class Student(SchoolMember):
    def __init__(self, name, age, sex ,stu_id, grade):
        super(Student, self).__init__(name, age, sex)
        self.stu_id = stu_id
        self.grade = grade
    
    def tell(self):
        print('''
        --- info Of Student:%s ---
        Nmae:%s
        Age:%s
        Sex:%s
        Stu_id:%s
        Grade:%s
        ''' % (self.name, self.name, self.age, self.sex, self.stu_id, self.grade))

    def pay_tuition(self,amout):
        print("%s has paid tution for $%s" % (self.name, amout))
# 值的初始化
school = School("My IT", "My Home")

t1 = Teacher("Mr", 56, "M", 20000, "iOS")

t2 = Teacher("Ar", 22, "M", 4000, "Python")

s1 = Student("ChenShan", 17, "M", "00001", "Python")

s2 = Student("FengT", 20, "M", "00002", "iOS")
# 打印相关信息
t1.tell()
s1.tell()
# 录入
school.hire(t1)
school.enroll(s1)
school.enroll(s2)
# 开始教课
school.staffs[0].teach()
# 交学费
for stu in school.students:
    stu.pay_tuition(5000)

        
        
