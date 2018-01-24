//: Playground - noun: a place where people can play

import UIKit

//可选链

/** Swift 中的可选链与 Objective-C 中的 nil 信息类似，但是它却工作在任意类型上，而且它能检测成功还是失败。 */

/** 可选链代替强制展开
 
 你可以通过在你希望如果可选项为非 nil 就调用属性、方法或者脚本的可选值后边使用问号（ ? ）来明确可选链。这和在可选值后放叹号（ ! ）来强制展开它的值非常类似。主要的区别在于可选链会在可选项为 nil 时得体地失败，而强制展开则在可选项为 nil 时触发运行时错误。
 
 为了显示出可选链可以在 nil 值上调用，可选链调用的结果一定是一个可选值，就算你查询的属性、方法或者下标返回的是非可选值。你可以使用这个可选项返回值来检查可选链调用是成功（返回的可选项包含值），还是由于链中出现了 nil 而导致没有成功（返回的可选值是 nil ）。
 
 另外，可选链调用的结果与期望的返回值类型相同，只是包装成了可选项。通常返回 Int 的属性通过可选链后会返回一个 Int? 。 */

//可选链下标访问数组、字典等时。要放在[]前面
//if let firstRoomName = john.residence?[0].name {
//    print("The first room name is \(firstRoomName).")
//} else {
//    print("Unable to retrieve the first room name.")
//}

