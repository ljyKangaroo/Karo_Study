#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'
#返回当前文件的相对路径
print(__file__)

import os
import sys
# 返回当前文件的绝对路径
file=os.path.abspath(__file__)
# dirname(文件的父路径)
print(os.path.dirname(file))

sys.path.append(file)

