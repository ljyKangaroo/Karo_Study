//: Playground - noun: a place where people can play

import UIKit

//闭包
/**
 全局函数是一个有名字但不会捕获任何值的闭包；
 内嵌函数是一个有名字且能从其上层函数捕获值的闭包；
 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包。
 
 利用上下文推断形式参数和返回值的类型；
 单表达式的闭包可以隐式返回；
 简写实际参数名；
 尾随闭包语法。
 */
//Sorted
/**
 Swift 的标准库提供了一个叫做 sorted(by:) 的方法，会根据你提供的排序闭包将已知类型的数组的值进行排序。一旦它排序完成， sorted(by:) 方法会返回与原数组类型大小完全相同的一个新数组，该数组的元素是已排序好的。原始数组不会被 sorted(by:) 方法修改。
 */

let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backWard(_ s1: String, _ s2: String) -> Bool {
   return s1 > s2
}

var reversedNames = names.sorted(by: backWard)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
//闭包的函数整体部分由关键字 in 导入，这个关键字表示闭包的形式参数类型和返回类型定义已经完成，并且闭包的函数体即将开始。

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//再从语境推断类型
reversedNames = names.sorted(by: {s1,s2 in return s1 > s2})

//单表达式闭包能够通过从它们的声明中删掉 return 关键字来隐式返回它们单个表达式的结果
reversedNames = names.sorted(by: {s1,s2 in s1 > s2})
//简写的实际参数名
//Swift 自动对行内闭包提供简写实际参数名，你也可以通过 $0 , $1 , $2 等名字来引用闭包的实际参数值。
reversedNames = names.sorted(by: {$0 > $1})
//运算符函数
reversedNames = names.sorted(by: >)
//尾随闭包
/** 如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式： */
func someFunctionThatTakesAClosure(_ closure:() -> Void){
    //function body goes here
    closure()
}

//here's how you call this function without using a trailing closure

someFunctionThatTakesAClosure({
    //closure's body goes here
    print(2)
})

//here's how you call this function with a trailing closure instead

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
    print(2)
}
//如果闭包表达式被用作函数唯一的实际参数并且你把闭包表达式用作尾随闭包，那么调用这个函数的时候你就不需要在函数的名字后面写一对圆括号 ( )。
reversedNames = names.sorted() { $0 > $1 }
//->
reversedNames = names.sorted { $0 > $1 }
let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]

let numbers = [16,58,510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
    
}
print(strings)
//捕获值
/** 在 Swift 中，一个能够捕获值的闭包最简单的模型是内嵌函数，即被书写在另一个函数的内部。一个内嵌函数能够捕获外部函数的实际参数并且能够捕获任何在外部函数的内部定义了的常量与变量。 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

makeIncrementer(forIncrement: 1)

print(makeIncrementer(forIncrement: 2)())
/** 作为一种优化，如果一个值没有改变或者在闭包的外面，Swift 可能会使用这个值的拷贝而不是捕获。
 
 Swift也处理了变量的内存管理操作，当变量不再需要时会被释放。 */
/**
 闭包是引用类型
 在上面例子中， incrementBySeven 和 incrementByTen 是常量，但是这些常量指向的闭包仍可以增加已捕获的变量 runningTotal 的值。这是因为函数和闭包都是引用类型。
 */
let alsoIncrementByTen = makeIncrementer(forIncrement: 1)
alsoIncrementByTen()
/** 逃逸闭包
 当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的。 */
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

someFunctionWithEscapingClosure {
    
}
/** 让闭包 @escaping 意味着你必须在闭包中显式地引用 self ，比如说，下面的代码中，传给 someFunctionWithEscapingClosure(_:) 的闭包是一个逃逸闭包，也就是说它需要显式地引用 self 。相反，传给 someFunctionWithNonescapingClosure(_:) 的闭包是非逃逸闭包，也就是说它可以隐式地引用 self */
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?()
print(instance.x)
