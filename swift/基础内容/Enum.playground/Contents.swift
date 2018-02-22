//: Playground - noun: a place where people can play

import UIKit

//枚举
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var type = CompassPoint.north
print(type)

/** 不像 C 和 Objective-C 那样，Swift 的枚举成员在被创建时不会分配一个默认的整数值。在上文的 CompassPoint例子中， north， south， east和 west并不代表 0， 1， 2和 3。而相反，不同的枚举成员在它们自己的权限中都是完全合格的值，并且是一个在 CompassPoint中被显式定义的类型。
 */
//当与 CompassPoint中可用的某一值一同初始化时 directionToHead的类型会被推断出来。一旦 directionToHead以 CompassPoint类型被声明，你就可以用一个点语法把它设定成不同的 CompassPoint值
type = .east
//“定义一个叫做 Barcode的枚举类型，它要么用 (Int, Int, Int, Int)类型的关联值获取 upc 值，要么用 String 类型的关联值获取一个 qrCode的值。”
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var code = Barcode.upc(8, 2222, 4444, 3)

//原始值

enum ControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
}

var state = ControlCharacter.lineFeed
print(state)
//递归枚举
/** 递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的。*/
//
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
evaluate(five)
evaluate(sum)

