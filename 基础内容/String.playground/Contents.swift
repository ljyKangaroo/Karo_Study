//: Playground - noun: a place where people can play

import UIKit

//Swift 的 String类型桥接到了基础库中的 NSString类。Foundation 同时也扩展了所有 NSString 定义的方法给 String 。也就是说，如果你导入 Foundation ，就可以在 String 中访问所有的 NSString  方法，无需转换格式。
//多行字符串
let singleLineString = "The"
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked. \(singleLineString)

"Begin at the beginning" the King said gravely, "and go on
till you come to the end; then stop."
"""


let emptyString = ""

if emptyString.isEmpty {
    print("Nothing to see here")
}

/** Swift 的 String类型是一种值类型。如果你创建了一个新的 String值， String值在传递给方法或者函数的时候会被复制过去，还有赋值给常量或者变量的时候也是一样。每一次赋值和传递，现存的 String值都会被复制一次，传递走的是拷贝而不是原本。值类型在结构体和枚举是值类型一章当中有详细描述。 */

//遍历String

for character in singleLineString {
 print(character)
}

var str = emptyString + singleLineString
/**
 转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
 任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。
 */

//要检查一个字符串是否拥有特定的字符串前缀或者后缀，调用字符串的 hasPrefix(_:)和 hasSuffix(_:)方法


