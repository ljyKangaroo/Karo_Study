//
//  KRCollectionViewCell.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/5/21.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class KRCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var contentLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func setupContentLB(text:String) -> () {
        contentLB.text = text
    }

}
