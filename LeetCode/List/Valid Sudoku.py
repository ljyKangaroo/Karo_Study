#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'
# 判断行
# 判断列
# 判断三三的九宫格
class Solution:
    # 有效的数独
    def isValidSudoku(self, board):
        return self.isValidRow(board) and self.isValidColumn(board) and self.isValidBox(board)

    def isValidRow(self, board):
        for i in range(9):
            flag = {}
            for j in range(9):
                if self.markFlag(flag, board[i][j]) == False:
                    return False
        return True

    def isValidColumn(self, board):
        for i in range(9):
            flag = {}
            for j in range(9):
                if self.markFlag(flag, board[j][i]) == False:
                    return False
        return True

    def isValidBox(self, board):
        for i in range(3):
            for j in range(3):
                flag = {}
                for m in range(3):
                    for n in range(3):
                        
                        if self.markFlag(flag, board[i*3+m][j*3+n]) == False:
                            return False
        return True
    
    def markFlag(self, flag, c):
        if c == '.':
            return True
        index = c
        if (index in flag) == False:
            flag[index] = True
            return True
        if flag[index]:
            return False
        
            
s = Solution()
l = [
    [".",".",".",".","5",".",".","1","."],[".","4",".","3",".",".",".",".","."],[".",".",".",".",".","3",".",".","1"],["8",".",".",".",".",".",".","2","."],[".",".","2",".","7",".",".",".","."],[".","1","5",".",".",".",".",".","."],[".",".",".",".",".","2",".",".","."],[".","2",".","9",".",".",".",".","."],[".",".","4",".",".",".",".",".","."]
    ]
print(s.isValidSudoku(l))