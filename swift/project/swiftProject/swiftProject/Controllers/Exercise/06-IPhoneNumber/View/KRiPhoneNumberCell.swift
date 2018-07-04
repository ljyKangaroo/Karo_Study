//
//  KRiPhoneNumberCell.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/5/22.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class KRiPhoneNumberCell: UITableViewCell {

    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var numberLB: UILabel!
    
    var model:Person? {
        didSet {
            guard let title = model?.name
                ,let number = model?.phone else {
                return
            }
            titleLB.text = title
            numberLB.text = number
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
