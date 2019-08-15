//
//  InterestCollectionViewCell.swift
//  Swift_30Day_5
//
//  Created by ZhangYi on 2019/8/15.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iamgeView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var interest: Interest? {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        guard let interest  = interest  else {
            return
        }
        label.text = interest.title
        iamgeView.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
       
}
