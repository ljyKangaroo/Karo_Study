//
//  ViewController.swift
//  02-CustomFont
//
//  Created by AlbertHuang on 2018/1/27.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Counter"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Actions
    @IBAction func ResetAction(_ sender: Any) {
        numLB.text = "\(0)"
    }
    
    @IBAction func tapAction(_ sender: Any) {
        if let tempNum = Int(numLB.text!) {
            numLB.text = "\(tempNum + 1)"
        }
        
    }
    
    @IBAction func tapChang(_ sender: UILongPressGestureRecognizer) {
        if(sender.state == .changed) {
            if let tempNum = Int(self.numLB.text!) {
                self.numLB.text = "\(tempNum + 1)"
            }
        }
        
    }
    
}
