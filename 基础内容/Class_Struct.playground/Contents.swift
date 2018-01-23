//: Playground - noun: a place where people can play

import UIKit

//类与结构体
/**
 共同点：
 定义属性用来存储值；
 定义方法用于提供功能；
 定义下标脚本用来允许使用下标语法访问值；
 定义初始化器用于初始化状态；
 可以被扩展来默认所没有的功能；
 遵循协议来针对特定类型提供标准功能。
 类有而结构体没有：
 
 继承允许一个类继承另一个类的特征;  //继承
 类型转换允许你在运行检查和解释一个类实例的类型； //类型转换
 反初始化器允许一个类实例释放任何其所被分配的资源；//反初始化
 引用计数允许不止一个对类实例的引用。 //自动引用计数
 结构体在你的代码中通过复制来传递，并且并不会使用引用计数。
 */
struct firstStructre {
    var width = 45
    var height = 0
}

class firstClass {
    var size = firstStructre()
    var laced = false
    var rate = 0.0
    var name: String?
}
//类与结构体实例
let someClass = firstClass()
let someStruct = firstStructre()
//访问属性
print(someStruct.width)
print(someClass.size.width)
someClass.size.width = 50
print(someStruct.width)
print(someClass.size.width)
//不同于 Objective-C，Swift 允许你直接设置一个结构体属性中的子属性。在上述最后一个栗子中， someVideoMode的 resolution属性中的 width这个属性可以直接设置，不用你重新设置整个 resolution 属性到一个新值。

//结构体类型的成员初始化器
let size = firstStructre(width: 44, height: 50)
print(size)

//值类型
var cinema = size
cinema.width = 2048
print(size,cinema)
//可以发现cinema 和size是两个完全不同的实例。

let tmpClass = firstClass()
tmpClass.size = firstStructre(width: 500, height: 100)
tmpClass.laced = true
tmpClass.name = "10086"
tmpClass.rate = 25.0
let alsoTmp = tmpClass
alsoTmp.rate = 30.0
print(tmpClass, alsoTmp)
//可以发现tmpClass 和alsoTmp是相同实例。因为类是引用类型。

//特征运算符  相同于 ( ===)  不相同于( !==)
/**
 “相同于”意味着两个类类型常量或者变量引用自相同的实例；
 “等于”意味着两个实例的在值上被视作“相等”或者“等价”，某种意义上的“相等”，就如同类设计者定义的那样。
 */

/** 类和结构体的选择
 结构体的主要目的是为了封装一些相关的简单数据值；
 当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用；
 任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用；
 结构体不需要从一个已存在类型继承属性或者行为。
 //结构体可以用来表示大小，路径，坐标等比较合适的定义。
*/

//PS:
/** Swift 的 String , Array 和 Dictionary类型是作为结构体来实现的，这意味着字符串，数组和字典在它们被赋值到一个新的常量或者变量，亦或者它们本身被传递到一个函数或方法中的时候，其实是传递了拷贝。

 这种行为不同于基础库中的 NSString, NSArray和 NSDictionary，它们是作为类来实现的，而不是结构体。 NSString , NSArray 和 NSDictionary实例总是作为一个已存在实例的引用而不是拷贝来赋值和传递
 */





