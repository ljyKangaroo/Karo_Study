//
//  VideoCell.swift
//  swiftProjectTests
//
//  Created by AlbertHuang on 2018/2/2.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}
protocol VideoCellDelegate {
    func cellPlayAction()
}

class VideoCell: UITableViewCell {

    @IBOutlet weak var viewdeoImageView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoSource: UILabel!
    
    var delegate: VideoCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func playAction(_ sender: Any) {
        delegate?.cellPlayAction()
    }
    
}
