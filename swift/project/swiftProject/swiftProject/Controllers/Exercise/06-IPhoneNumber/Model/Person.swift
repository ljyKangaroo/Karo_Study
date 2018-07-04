//
//  Person.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/5/22.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String?
    
    var phone: String?
    
    var title: String?
    
    override init() {
        
    }
    
    init(name:String, phone: String,title: String) {
        self.name = name
        self.phone = phone
        self.title = title
    }
}
