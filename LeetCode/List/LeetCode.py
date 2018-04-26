#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# ' a test module '

# __author__ = 'Karo'


class Solution:
    #从排序数组中删除重复项
    def removeDuplicates(self, nums):
        # 原理 用一个int来记录值的不同、当遇到不同值时放入排序前。这样即可保证列表前的都是去重之后的值
        k=0  
        for i in range(1,len(nums)):  
            if nums[i] != nums[k]:  
                k+=1  
                nums[k] = nums[i]  
        print(k)
        del nums[k+1:len(nums)]  
        print (nums)
        return len(nums)  
    #买卖股票的最佳时机 II
    def maxProfit(self, prices):
        #要有一个值来记录买卖。买了才能卖，卖了才能吗买
        if len(prices) == 0:
            return 0
        max = 0
        mai = -1
        mai2 = 0#用于记录买卖
        for i in range(len(prices)):
            if i + 1 < len(prices) and prices[i] < prices[i+1] :
                if mai > -1:
                    if mai2 == -1:
                        mai = i
                        mai2 = -2
                else:
                    mai = i
                    mai2 = -2

            if i + 1 >= len(prices):
                if mai2 == -2 :
                    max +=prices[i] - prices[mai]
                    mai2 = -1
            else:
                if prices[i] > prices[i+1]:
                    if mai2 == -2 :
                        max += prices[i] - prices[mai]
                        mai2 = -1
        print(max)
        return max
    #旋转数组
    def rotate(self,nums,k):
        if len(nums) == 0 or k<0 :
            return
        count = len(nums)
        if k>count:
            k = k - count
        #先反转整个数组
        self.ReverseArray(nums,count,0,count-1)
        #反转前K个数
        self.ReverseArray(nums,count,0,k-1)
        #反转剩下的数
        self.ReverseArray(nums,count,k,count-1)
        print(nums)
            
    def ReverseArray(self,nums,nCount,nStart,nEnd):
        if len(nums)==0 or nStart < 0 or nStart>nCount or nEnd < 0 or nEnd>=nCount:
            return False
        while nStart <nEnd:
            tmp = nums[nStart]
            nums[nStart] = nums[nEnd]
            nums[nEnd] = tmp

            nStart +=1
            nEnd -=1
        return True
    #存在重复 方法，先排序，再按排序去重方法校验 也可以双重循环找出重复，但效率较低
    def containsDuplicate(self,nums):
        count = len(nums)
        if count == 0:
            return False 
        nums.sort()
        k=0
        for i in range(1,count):  
            if nums[i] != nums[k]:  
                k+=1   
        
        if k == count -1:
            return False
        else:
            return True
    #只出现一次的数字  全部异或一遍即可。或者先排序再比较 
    def singleNumber(self, nums):
        '''
        ss = 0
        for i in nums:
            ss = ss^i
        return ss
        '''
        nums.sort()
        if len(nums)==1:
            return nums[0]
        else:  
            if nums[0] != nums[1]:
                return nums[0]
            elif nums[len(nums) - 1] != nums[len(nums) - 2]:
                return nums[len(nums) - 1]
            else:
                for n in range(len(nums)):
                    #当前一个数与后一个数都不一样时，即是正确答案
                    if nums[n + 2] != nums[n + 1] and nums[n+2] != nums[n+3]:
                        return nums[n + 2]
    #两个数组的交集 思路：先排序，依次比较大小。
    def intersect(self, nums1, nums2):
        nums1.sort()
        nums2.sort()
        new = []
        number = 0
        i=0
        j=0
        while i<len(nums1) and j < len(nums2):
            if nums1[i] == nums2[j]:
                new.append(nums1[i])
                i+=1
                j+=1
            elif nums1[i] < nums2[j]:
                i+=1
            else:
                j+=1
        print(new)
        return new

class One(object):
    #加一 思路：先转化成number 然后再加一。再转化成list
    def plusOne(self, nums):
        number = 0
        new = []
        for index,i in enumerate(nums):
            number += i * pow(10,(len(nums) - index - 1))
        number +=1

        newNumber = 0
        max = number
        for j in range(len(str(number))):
            newNumber = max / pow(10,(len(str(number))-j-1))
            newNumber = int(newNumber)
            max -= newNumber * pow(10,(len(str(number))-j-1))
            new.append(newNumber)
        return new
    #移动零 思路：先把非零移到前面来。然后再让后面的全为零
    def moveZeroes(self, nums):
        
        j = 0
        for i in range(len(nums)):
            if nums[i] !=0:
                nums[j] = nums[i]
                j +=1
        
        for index in range(j,len(nums)):
            nums[index] =0
        print(nums)
    #两数之和
    def twoSum(self, nums, target):
        '''此方法会超出LeetCode的时间限制
        i = 0
        while i < len(nums):
            for j in range(i+1, len(nums)):
                if nums[i]+nums[j] == target :
                    return [i, j]
            i+=1
        '''
        # 利用字典存差值匹配。
        tmpDict = {}
        i = 0
        while i < len(nums):
            if str(nums[i]) in tmpDict:
                return [i,tmpDict[str(nums[i])]]
            tmpDict[str(target - nums[i])] = i
            i+= 1
    def isValidSudoku(self, board):
   
        
        
# s = Solution()
# print(tmp)
# s.removeDuplicates(tmp)
l = [0,0,3]
# m = [1,123,2]
# s.maxProfit(l)
# s.rotate(l,4)
# print(s.containsDuplicate(l))
# s.singleNumber(l)
# s.intersect(l,m)
s = One()
# s.plusOne(l)
# s.moveZeroes(l)
print(s.twoSum([-1,-2,-3,-4,-5],-8))