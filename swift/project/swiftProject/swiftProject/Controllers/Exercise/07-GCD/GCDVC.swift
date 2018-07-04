//
//  GCDVC.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/5/21.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class GCDVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        asyncConcurrent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
//MARK: 基础使用
extension GCDVC {
//    //1. 并行队列 + 同步执行
//    func syncConcurrent()  {
//        print("syncConcurrent---begin")
//        let queue = DispatchQueue.init(label: "test.queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
//        queue.sync {
//            for _ in 0..<2 {
//                print("=====\(1)====\n",Thread.current)
//            }
//        }
//        queue.sync {
//            for _ in 0..<2 {
//                print("=====\(2)====\n",Thread.current)
//            }
//        }
//        queue.sync {
//            for _ in 0..<2 {
//                print("=====\(3)====\n",Thread.current)
//            }
//        }
//        print("syncConcurrent---end")
//    }
//    //2. 并行队列 + 异步执行
//    func asyncConcurrent() {
//
//        print("asyncConcurrent---begin")
//        let queue = DispatchQueue.init(label: "test.queue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
//
//        queue.async {
//            for _ in 0..<2 {
//                print("=====\(1)====\n",Thread.current)
//            }
//        }
//        queue.async {
//            for _ in 0..<2 {
//                print("=====\(2)====\n",Thread.current)
//            }
//        }
//        queue.async {
//            for _ in 0..<2 {
//                print("=====\(3)====\n",Thread.current)
//            }
//        }
//        print("asyncConcurrent---end")
//    }
    //3. 串行队列 + 同步执行
    func syncSerial() {
        print("syncSerial---begin")
        
        let queue = DispatchQueue.init(label: "test.queue")
        
        queue.sync {
            for _ in 0..<2 {
                print("=====\(1)====\n",Thread.current)
            }
        }
        queue.sync {
            for _ in 0..<2 {
                print("=====\(2)====\n",Thread.current)
            }
        }
        queue.sync {
            for _ in 0..<2 {
                print("=====\(3)====\n",Thread.current)
            }
        }
        
        print("syncSerial---end")
        
    }
    //4. 串行队列 + 异步执行
    func asyncSerial() {
        print("asyncSerial---begin")
        let queue = DispatchQueue.init(label: "test.queue")
        
        queue.async {
            for _ in 0..<2 {
                print("=====\(1)====\n",Thread.current)
            }
        }
        queue.async {
            for _ in 0..<2 {
                print("=====\(2)====\n",Thread.current)
            }
        }
        queue.async {
            for _ in 0..<2 {
                print("=====\(3)====\n",Thread.current)
            }
        }
        print("asyncSerial---end")

    }
    
}
