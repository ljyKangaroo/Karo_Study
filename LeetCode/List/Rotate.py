#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'

class Solution:
    # 旋转图像 思路：先上下 再对角、若可开辟新空间则新建一个遍历一遍即可
    def rotate(self, matrix):
        """
        旋转图像
        :type matrix: List[List[int]]
        :rtype: void Do not return anything, modify matrix in-place instead.
        """
        n = len(matrix)
        for i in range(int(n/2)):
            for j in range(n):
                tmp = matrix[i][j]
                matrix[i][j] = matrix[n-1-i][j]
                matrix[n-1-i][j] = tmp
        for i in range(n):
            for j in range(i):
                tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp

s = Solution()
matrix =[[1,2,3],[4,5,6],[7,8,9]]
s.rotate(matrix)
print (matrix)