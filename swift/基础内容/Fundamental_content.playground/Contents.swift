//: Playground - noun: a place where people can play
// MARK: 基础内容-2018.01.22
import UIKit

//快捷赋值
var x = 0.0,y = "y",z = (() -> ()).self

//类型标注
var str: String?

str = "123"
str = nil
//输出
print(str as Any)

print("String is \(str ?? "2")")
//Swift 提供了 8，16，32 和 64 位编码的有符号和无符号整数，这些整数类型的命名方式和 C 相似，例如 8 位无符号整数的类型是 UInt8 ，32 位有符号整数的类型是 Int32 。与 Swift 中的其他类型相同，这些整数类型也用开头大写命名法。

let minValue = UInt8.min // 最小值是 0, 值的类型是 UInt8
let maxValue = UInt8.max // 最大值是 255, 值得类型是 UInt8
/**
 
 在32位平台上， Int 的长度和 Int32 相同。
 在64位平台上， Int 的长度和 Int64 相同。
 
 Double代表 64 位的浮点数。
 Float 代表 32 位的浮点数。
 
 Double 有至少 15 位数字的精度，而 Float 的精度只有 6 位。具体使用哪种浮点类型取决于你代码需要处理的值范围。在两种类型都可以的情况下，推荐使用 Double 类型。
 
 */

//类型安全

/**
 Swift 是一门类型安全的语言。类型安全的语言可以让你清楚地知道代码可以处理的值的类型。如果你的一部分代码期望获得 String ，你就不能错误的传给它一个 Int 。
 
 因为 Swift 是类型安全的，他在编译代码的时候会进行类型检查，任何不匹配的类型都会被标记为错误。这会帮助你在开发阶段更早的发现并修复错误。
 
 当你操作不同类型的值时，类型检查能帮助你避免错误。当然，这并不意味着你得为每一个常量或变量声明一个特定的类型。如果你没有为所需要的值进行类型声明，Swift 会使用类型推断的功能推断出合适的类型。通过检查你给变量赋的值，类型推断能够在编译阶段自动的推断出值的类型。
 
 因为有了类型推断，Swift 和 C 以及 Objective-C 相比，只需要少量的类型声明。其实常量和变量仍然需要明确的类型，但是大部分的声明工作 Swift 会帮你做。
 
 在你为一个变量或常量设定一个初始值的时候，类型推断就显得更加有用。它通常在你声明一个变量或常量同时设置一个初始的字面量（文本）时就已经完成。（字面量就是会直接出现在你代码中的值，比如下边代码中的 42 和 3.14159 。）
 */

//类型别名可以为已经存在的类型定义了一个新的可选名字。用 typealias 关键字定义类型别名。
typealias ZDInt = UInt8

let zdInt:ZDInt = ZDInt.max

//元组 元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型。

let http404Error = (404, "Not Found") //直接赋值

let (code, message) = http404Error //类型对应赋值

print("Code is \(code)")
print("Message is \(message)")
//下标取值
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
/** PS：元组在临时的值组合中很有用，但是它们不适合创建复杂的数据结构。如果你的数据结构超出了临时使用的范围，那么请建立一个类或结构体来代替元组。更多信息请参考类和结构体。 */

//错误处理

func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

//断言

let age = 3
assert(age >= 0, "A person's age cannot be less than zero")

//guard 在swift大多使用这个来替代if

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "Jane", "location": "Cupertino"])
