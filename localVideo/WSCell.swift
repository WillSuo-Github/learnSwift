//
//  WSCell.swift
//  learnSwift
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

struct Video {
    let image: String
    let title: String
    let source: String
}

class WSCell: UITableViewCell {

    @IBOutlet weak var videoScreenShort: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
