//: Playground - noun: a place where people can play

import UIKit

//控制流  --

let names = ["1","2","3","4","5","6","7"]
for name in names {
    print(name)
}

let tmpDict = ["key" : "value", "key2" : "value2", "key3" : "value3"]

for (key, value) in tmpDict {
    print("key is \(key), value is \(value)")
}

for index in 1...5 {
    print(index)
}
let minutes = 60
for tickMark in 0..<minutes {
    // render the tick mark each minute (60 times)
    print(tickMark)
}
//有些用户可能想要在他们的UI上少来点分钟标记。比如说每 5 分钟一个标记吧。使用 stride(from:to:by:) 函数来跳过不想要的标记。
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}
//闭区间也同样适用，使用 stride(from:through:by:) 即可：
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
    print(tickMark)
}
/**
 while 在每次循环开始的时候计算它自己的条件；
 repeat-while 在每次循环结束的时候计算它自己的条件。
 */

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
//repeat {
//    // move up or down for a snake or ladder
//    square += board[square]
//    // roll the dice
//    diceRoll += 1
//    if diceRoll == 7 { diceRoll = 1 }
//    // move by the rolled amount
//    square += diceRoll
//} while square < finalSquare
print("Game over!")

//swift 的 switch 不会隐式贯穿。so
/**
 switch type {
 case 1:
 case 2:
 print("The ")
 }
 这种写法是不可行的
 */
let type:Character = "a"
switch type {
case "a","A":
    print("The letter A")
default:
    print("No A")
}
//可用区间匹配、元组->switch 贼好用。
//switch 情况可以将匹配到的值临时绑定为一个常量或者变量，来给情况的函数体使用。这就是所谓的值绑定，因为值是在情况的函数体里“绑定”到临时的常量或者变量的。
//switch 情况可以使用 where 分句来检查额外的情况。
let point = (1,-1)
switch point {
case let(x, y) where x == y:
    print("相同")
case let(x, y) where x == -y:
    print("相反")
case let(x, y):
    print("\(x),\(y)")
}
/** 控制转移语句在你代码执行期间改变代码的执行顺序，通过从一段代码转移控制到另一段。Swift 拥有五种控制转移语句：
 
 continue //在一个包含条件和自增器的 for 循环中，循环的自增器仍然会在调用 continue 语句后评定。循环自身还是会和往常一样工作；只有循环体中的代码被跳过。
 
 break //break 语句会立即结束整个控制流语句。当你想要提前结束 switch 或者循环语句或者其他情况时可以在 switch 语句或者循环语句中使用 break 语句。
 
 fallthrough/fallthrough 关键字不会为switch情况检查贯穿入情况的条件。 fallthrough 关键字只是使代码执行直接移动到下一个情况（或者 default 情况）的代码块中，就像C的标准 switch 语句行为一样。
 
 throw
 */

//guard - 提前退出
func greet(_ person: [String: String]) {
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

greet(["name": "John"])
// prints "Hello John!"
// prints "I hope the weather is nice near you."
greet(["name": "Jane", "location": "Cupertino"])
