//: Playground - noun: a place where people can play

import UIKit

//类型转换

/** 可以在类及其子类层次中使用类型转换来判断特定类实例的类型并且在同一类层次中将该实例类型转换为另一个类。下面的三段代码定义了一个类层次以及一个包含了这些类实例的数组，作为类型转换的例子。 */
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
//类型检查  使用类型检查操作符 （ is ）来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回 true ，否则返回 false 。
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
//向下类型转换

/**
 某个类类型的常量或变量可能实际上在后台引用自一个子类的实例。当你遇到这种情况时你可以尝试使用类型转换操作符（ as? 或 as! ）将它向下类型转换至其子类类型。
 
 由于向下类型转换能失败，类型转换操作符就有了两个不同形式。条件形式， as? ，返回了一个你将要向下类型转换的值的可选项。强制形式， as! ，则将向下类型转换和强制展开结合为一个步骤。
 
 如果你不确定你向下转换类型是否能够成功，请使用条件形式的类型转换操作符 （ as? ）。使用条件形式的类型转换操作符总是返回一个可选项，如果向下转换失败，可选值为 nil 。这允许你检查向下类型转换是否成功。
 
 当你确信向下转换类型会成功时，使用强制形式的类型转换操作符（ as! ）。当你向下转换至一个错误的类型时，强制形式的类型转换操作符会触发一个运行错误。
 */

for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}
//PS: 类型转换实际上不会改变实例及修改其值。实例不会改变；它只是将它当做要转换的类型来访问。


//Any 和 AnyObject 的类型转换
/**
 - AnyObject  可以表示任何类类型的实例。
 - Any  可以表示任何类型，包括函数类型。
 */
var things = [Any]()
var thingsO = [AnyObject]()
//注意

//Any类型表示了任意类型的值，包括可选类型。如果你给显式声明的Any类型使用可选项，Swift 就会发出警告。如果你真心需要在Any值中使用可选项，如下所示，你可以使用as运算符来显式地转换可选项为Any。
let optionalNumber: Int? = 3
//things.append(optionalNumber)        // Warning
things.append(optionalNumber as Any) // No warning





