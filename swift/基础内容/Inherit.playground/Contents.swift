//: Playground - noun: a place where people can play

import UIKit

//继承

/** 一个类可以从另一个类继承方法、属性和其他的特性。当一个类从另一个类继承的时候，继承的类就是所谓的子类，而这个类继承的类被称为父类。在 Swift 中，继承与其他类型不同的基础分类行为。 */

// MARK: 重写  要重写而不是继承一个特征，你需要在你的重写定义前面加上 override 关键字。这样做说明你打算提供一个重写而不是意外提供了一个相同定义。

class Vehicle {
    var gear = 1
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print(1)
    }
}

class SomeVehicle: Vehicle {
    override var description: String {
        return super.description + "2"
    }
    override func makeNoise() {
        super.makeNoise()
        print(2)
    }
}

let somev = SomeVehicle()
somev.makeNoise()
//重写属性观察器
class AutomaticCar: Vehicle {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
            print(gear)
        }
    }
}
let v = AutomaticCar()
v.currentSpeed = 10
print(v.gear)

//阻止重写 -- 加上final修饰符

//初始化  convenience便捷初始化  init指定初始化

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

//由于 RecipeIngredient init(name: String)重写了Food的初始化。所以即使是便捷初始化也要加上 override修饰符

//可失败初始化

/** 定义类、结构体或枚举初始化时可以失败在某些情况下会管大用。这个失败可能由以下几种方式触发，包括给初始化传入无效的形式参数值，或缺少某种外部所需的资源，又或是其他阻止初始化的情况。
 
 为了妥善处理这种可能失败的情况，在类、结构体或枚举中定义一个或多个可失败的初始化器。通过在 init 关键字后面添加问号( init? )来写。
 
 严格来讲，初始化器不会有返回值。相反，它们的角色是确保在初始化结束时， self 能够被正确初始化。虽然你写了 return nil 来触发初始化失败，但是你不能使用 return 关键字来表示初始化成功了。
 可失败初始化器为数字类型转换器做实现。为了确保数字类型之间的转换保持值不变，使用 init(exactly:)  初始化器。如果类型转换不能保持值不变，初始化器失败。*/


let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to int maintains value")
}
// Prints "12345.0 conversion to int maintains value"

let valueChanged = Int(exactly: pi)
// valueChanged is of type Int?, not Int

if valueChanged == nil {
    print("\(pi) conversion to int does not maintain value")
}

//必要初始化器
/** 在类的初始化器前添加 required  修饰符来表明所有该类的子类都必须实现该初始化器：
    如果子类继承的初始化器能够满足需求，则你无需显式地在子类中提供必要初始化器的实现。*/

//当子类重写父类的必要初始化器时，必须在子类的初始化器前同样添加 required 修饰符以确保当其它类继承该子类时，该初始化器同为必要初始化器。在重写父类的必要初始化器时，不需要添加 override 修饰符：

//反初始化
/** 在类实例被释放的时候，反初始化器就会立即被调用。你可以是用 deinit 关键字来写反初始化器，就如同写初始化器要用 init 关键字一样。反初始化器只在类类型中有效。 */

