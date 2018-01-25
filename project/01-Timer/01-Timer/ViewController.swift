//
//  ViewController.swift
//  01-Timer
//
//  Created by AlbertHuang on 2018/1/25.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var contentView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        contentView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupUI(){
        self.view.addSubview(contentView)
    }


}

