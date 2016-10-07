//
//  WSCollectionViewCell.swift
//  learnSwift
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class WSCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var interest: Interest! {
        
        didSet{
            
            setUpUI()
        }
    }
    
    private func setUpUI(){
    
        titleLabel.text = interest.title
        imageView.image = interest.image
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
