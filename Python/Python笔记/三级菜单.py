#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

#三级菜单

cities={
    '北京':{
        '朝阳':['国贸','CBD','天阶','我爱我家','链接地产'],
        '海淀':['圆明园','苏州街','中关村','北京大学'],
        '昌平':['沙河','南口','小汤山',],
        '怀柔':['桃花','梅花','大山'],
        '密云':['密云A','密云B','密云C']
    },
    '河北':{
        '石家庄':['石家庄A','石家庄B','石家庄C','石家庄D','石家庄E'],
        '张家口':['张家口A','张家口B','张家口C'],
        '承德':['承德A','承德B','承德C','承德D']
    },
    '山东':{
        '德州':{},
        '青岛':{}
    }
}

def noDatainput():
    back=input("没有数据了，请输入b或者q返回退出>>:")
    if back == "b":
        return back
    elif back == "q":
        exit()
    else:
        print("输入错误，已退出")
        exit()

def nextCity(cityDict,index):
    while True:

        if len(cityDict) == 0:
            back=noDatainput()
            if back == "b":
                break

        for i in cityDict:
            print(i)
        choice=input("选择进入>>:")
        if choice == "b":
            if index > 3:
                pass
            else:
                break
        elif choice == "q":
            exit()
        if choice in cityDict:
            if index > 3:
                pass
            else:         
                if type(cityDict) == dict:
                    nextCity(cityDict[choice],index+1)
                else:
                    back=noDatainput()
                    if back == "b":
                        break
        else:
            print("输入错误，请重新输入")

nextCity(cities,0)
