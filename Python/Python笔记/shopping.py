#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

# 购物车实践。
product_list = [
('Iphone',5800),
('Mac Pro',8500),
('Bike',800),
('Watch',10600),
('Coffee',31)
]

shopping_list=[]

def print_shopping_list():
    #打印商品列表
    for index,item in enumerate(product_list):
            # print(item)
            print(index,item)


salary=input("Input your salary:")
if salary.isdigit():
    salary=int(salary) 
    while True:
        
        print_shopping_list()
        #选择商品
        user_choice=input("选择要买的商品？>>>:")
        if user_choice.isdigit():
            user_choice=int(user_choice)
            if user_choice<len(product_list) and user_choice>=0:
                p_item = product_list[user_choice]
                #买得起
                if p_item[1] <= salary:
                    shopping_list.append(p_item)
                    salary -= int(p_item[1])
                    print("Added %s into shopping cart,余额还剩 %s" %(p_item,salary))
                else:
                    print("你的余额只剩[%s]" %salary)
            else:
                print("你所选择的 [%s]商品编号不存在" %user_choice)
        elif user_choice == 'q':
            print("------shopping list------")
            print_shopping_list()
            exit("你的余额只剩：%s" %salary)
        else:
            print('输入有误')        