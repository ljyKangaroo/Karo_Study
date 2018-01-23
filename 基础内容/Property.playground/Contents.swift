//: Playground - noun: a place where people can play

import UIKit

//属性
// MARK: 存储属性  var  和  let

struct FixedLengthRange {
    var value: Int
    let length: Int
}
var rangeLength = FixedLengthRange(value: 100, length: 200)

//rangeLength.length = 6 此时的length被初始化完之后便不能更改。因为是常量属性，即便声明了变量的rangeLength

// MARK: 延迟存储属性 //oc中的懒加载？  lazy 修饰语来表示一个延迟存储属性

//你必须把延迟存储属性声明为变量（使用 var 关键字），因为它的初始值可能在实例初始化完成之前无法取得。常量属性则必须在初始化完成之前有值，因此不能声明为延迟。
class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
//    lazy var importer: DataImporter = {
//        return DataImporter()
//    }
    var data = [String]()
}

let manager = DataManager()
manager.importer.fileName.append(".text?")
manager.data.append("Some more data")
//如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次。


// MARK: 计算属性
//除了存储属性，类、结构体和枚举也能够定义计算属性，而它实际并不存储值。相反，他们提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值。
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//简写设置器（setter）声明
//如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为 newValue 。下面是结构体 Rect 的另一种写法，其中利用了简写设置器声明的特性。
//即上面的newCenter可以直接简写成newValue
/** 只读计算属性
 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值。
 你必须用 var 关键字定义计算属性——包括只读计算属性——为变量属性，因为它们的值不是固定的。 let 关键字只用于常量属性，用于明确那些值一旦作为实例初始化就不能更改。
 */
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
/** 这种时候volume便是Cuboid里面的一个只读属性
 你可以通过去掉 get 关键字和他的大扩号来简化只读计算属性的声明：*/


// MARK: 属性观察者

/**
 属性观察者会观察并对属性值的变化做出回应。每当一个属性的值被设置时，属性观察者都会被调用，即使这个值与该属性当前的值相同。
 你可以为你定义的任意存储属性添加属性观察者，除了延迟存储属性。你也可以通过在子类里重写属性来为任何继承属性（无论是存储属性还是计算属性）添加属性观察者。属性重载将会在重写中详细描述。
 
 你不需要为非重写的计算属性定义属性观察者，因为你可以在计算属性的设置器里直接观察和相应它们值的改变。
 */
//willSet 会在该值被存储之前被调用， didSet 会在一个新值被存储后被调用。
//父类属性的 willSet 和 didSet 观察者会在子类初始化器中设置时被调用。它们不会在类的父类初始化器调用中设置其自身属性时被调用。

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print(newValue)
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 10

stepCounter.totalSteps = 15

/** 如果你以输入输出形式参数传一个拥有观察者的属性给函数， willSet 和 didSet 观察者一定会被调用。这是由于输入输出形式参数的拷贝入拷贝出存储模型导致的：值一定会在函数结束后写回属性。更多关于输入输出形式参数行为的讨论，参见输入输出形式参数。 */

/** 全局和局部变量
 
 上边描述的计算属性和观察属性的能力同样对全局变量和局部变量有效。全局变量是定义在任何函数、方法、闭包或者类型环境之外的变量。局部变量是定义在函数、方法或者闭包环境之中的变量。
 
 你在之前章节中所遇到的全局和局部变量都是存储变量。存储变量，类似于存储属性，为特定类型的值提供存储并且允许这个值被设置和取回。
 
 总之，你同样可以定义计算属性以及给存储变量定义观察者，无论是全局还是局部环境。计算变量计算而不是存储值，并且与计算属性的写法一致。
 
 注意
 
 全局常量和变量永远是延迟计算的，与延迟存储属性有着相同的行为。不同于延迟存储属性，全局常量和变量不需要标记 lazy 修饰符。
 
 */

/** 类型属性
 
 实例属性是属于特定类型实例的属性。每次你创建这个类型的新实例，它就拥有一堆属性值，与其他实例不同。
 
 你同样可以定义属于类型本身的属性，不是这个类型的某一个实例的属性。这个属性只有一个拷贝，无论你创建了多少个类对应的实例。这样的属性叫做类型属性。
 
 类型属性在定义那些对特定类型的所有实例都通用的值的时候很有用，比如实例要使用的常量属性（类似 C 里的静态常量），或者储存对这个类型的所有实例全局可见的值的存储属性（类似 C 里的静态变量）。
 
 存储类型属性可以是变量或者常量。计算类型属性总要被声明为变量属性，与计算实例属性一致。
 
 注意
 
 不同于存储实例属性，你必须总是给存储类型属性一个默认值。这是因为类型本身不能拥有能够在初始化时给存储类型属性赋值的初始化器。
 
 存储类型属性是在它们第一次访问时延迟初始化的。它们保证只会初始化一次，就算被多个线程同时访问，他们也不需要使用 lazy 修饰符标记。
 */

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
