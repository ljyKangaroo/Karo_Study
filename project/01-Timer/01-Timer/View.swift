//
//  View.swift
//  01-Timer
//
//  Created by AlbertHuang on 2018/1/25.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class View: UIView {
    @objc lazy var playBtn = UIButton()
    @objc lazy var pauseBtn = UIButton()
    lazy var resetBtn = UIButton()
    lazy var timeLB = UILabel()
    lazy var timer = Timer.init()
    
    var counter = 0.0
    var isPlaying = false
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var topY:CGFloat = 64
        let centerX = self.center.x
        
        resetBtn.frame = CGRect.init(x: Int(centerX - 50), y: Int(topY), width: 100, height: 50)
        topY += resetBtn.frame.height
        
        timeLB.frame = CGRect.init(x: 0, y: Int(topY), width: Int(self.frame.size.width), height: 200)
        topY += timeLB.frame.height
        
        playBtn.frame = CGRect.init(x: 0, y: Int(topY), width: Int(self.frame.size.width * 0.5), height: Int(self.frame.size.height - topY))
        
        pauseBtn.frame = CGRect.init(x: Int(self.frame.size.width * 0.5), y: Int(topY), width: Int(self.frame.size.width * 0.5), height: Int(self.frame.size.height - topY))
        
        
    }
    
    func setupUI() {
        self.addSubview(resetBtn)
        self.addSubview(timeLB)
        self.addSubview(playBtn)
        self.addSubview(pauseBtn)
        setupColor()
        setupBtn()
        
        playBtn.addTarget(self, action: #selector(self.playBtnAction), for: .touchUpInside)
        pauseBtn.addTarget(self, action: #selector(self.pauseBtnAction), for: .touchUpInside)
        resetBtn.addTarget(self, action: #selector(self.resetBtnAction), for: .touchUpInside)
        
    }
 
    func setupColor() {
        self.backgroundColor =  #colorLiteral(red: 0.03529411765, green: 0.007843137255, blue: 0.1333333333, alpha: 1)
        playBtn.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.3647058824, blue: 0.9882352941, alpha: 1)
        pauseBtn.backgroundColor = #colorLiteral(red: 0.4, green: 0.7450980392, blue: 0.03137254902, alpha: 1)
        
    }
    
    func setupBtn() {
        playBtn.setImage(UIImage.init(named: "play"), for: .normal)
        pauseBtn.setImage(UIImage.init(named: "pause"), for: .normal)
        resetBtn.setTitle("Reset", for: .normal)
        resetBtn.setTitleColor(UIColor.white, for: .normal)
        
        timeLB.textColor = UIColor.white
        timeLB.text = String(counter)
        timeLB.textAlignment = NSTextAlignment.center
        timeLB.font = UIFont.systemFont(ofSize: 80)
    }
    
    @objc func resetBtnAction() {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLB.text = String(counter)
        playBtn.isEnabled  = true
        pauseBtn.isEnabled = true
    }
    
    @objc func playBtnAction() {
        if(isPlaying){return}
        
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.timerAciton), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @objc func pauseBtnAction() {
        timer.invalidate()
        isPlaying = false
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
    }
    
    
    @objc func timerAciton() {
        counter = counter + 0.1
        timeLB.text = String(format: "%.1f", counter)
    }
    
}
