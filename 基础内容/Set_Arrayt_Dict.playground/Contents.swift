//: Playground - noun: a place where people can play

import UIKit

//数组Array

var someInts = [Int]()

someInts.append(3)

someInts = []

//使用默认值创建数组

//Swift 的 Array类型提供了初始化器来创建确定大小且元素都设定为相同默认值的数组。你可以传给初始化器对应类型的默认值（叫做 repeating）和新数组元素的数量（叫做 count）：

var tmpArray = Array.init(repeating: 2, count: 5)

//连接数组

var one = ["123", "234"]

var two = ["2", "3"]

var three = one + two

var shoppingList = ["Eggs", "Milk"]

//用isEmpty来判空

if shoppingList.isEmpty {
    print("空")
} else {
    print("\(shoppingList)")
}

//插入  insert(_:at:) 移除 remove(at:)

//遍历  -> for-in

//遍历若需要索引。可用enumerated()

for (index, value) in shoppingList.enumerated() {
    print("Item:\(index + 1 ): \(value) ")
}

//字典

var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen" //下标直接创建
print(namesOfIntegers)
//判空也是isEmpty

namesOfIntegers.updateValue("sevenTeen", forKey: 16)
print(namesOfIntegers)
/** 另外，使用 removeValue(forKey:)来从字典里移除键值对。这个方法移除键值对如果他们存在的话，并且返回移除的值，如果值不存在则返回 nil： */
if let removedValue = namesOfIntegers.removeValue(forKey: 15) {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//遍历

for (airportCode, airportName) in namesOfIntegers {
    print("\(airportCode): \(airportName)")
}

for airportCode in namesOfIntegers.keys {
    print("namesOfIntegers code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in namesOfIntegers.values {
    print("namesOfIntegers name: \(airportName)")
}

//用字典的键或值创建Array
let airportCodes = [Int](namesOfIntegers.keys)
let airportNames = [String](namesOfIntegers.values)

