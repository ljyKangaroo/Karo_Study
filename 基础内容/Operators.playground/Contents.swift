//: Playground - noun: a place where people can play

import UIKit

//基本运算符 - 2018.01.22

///< Swift 提供了两种 C 中没有的区间运算符（ a..<b  和 a...b ），来让你便捷表达某个范围的值。

//运算符包括一元、二元、三元：
var a = 200

let b = 2 + 3

let c = false ? b : 13

let (x, y) = (1, 5)

print(x)

//余数

let yu = a % c

//合并空值运算符

let unNil = nil ?? b

var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
potentialOverflow += 1
// this causes an error

