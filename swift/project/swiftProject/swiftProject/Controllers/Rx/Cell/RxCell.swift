//
//  RxCell.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/6/1.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class RxCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var singer: UILabel!
    
    var model:Music? {
        didSet {
            guard let n = model?.name
                ,let s = model?.singer else {
                    return
            }
            name.text = n
            singer.text = s
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
