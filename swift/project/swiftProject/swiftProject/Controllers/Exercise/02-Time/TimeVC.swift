//
//  TimeVC.swift
//  02-CustomFont
//
//  Created by AlbertHuang on 2018/2/1.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class TimeVC: UIViewController {

    @IBOutlet weak var timeLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Now Time"
        timeLB.adjustsFontSizeToFitWidth = true
        updateTime()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateTimeAction(_ sender: Any) {
        updateTime()
    }
    
    private func updateTime() {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        timeLB.text = dateFormatter.string(from: Date.init())
    }

}
