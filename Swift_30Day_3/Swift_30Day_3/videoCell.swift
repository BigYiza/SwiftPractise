//
//  videoCell.swift
//  Swift_30Day_3
//
//  Created by ZhangYi on 2019/2/23.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import Foundation
import UIKit

struct VideoSource {
    let image: String
    let title: String
    let source: String
}

class videoCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    var config: VideoSource? = nil
    var playCallback: ((_ source: String?) -> Void)? = nil
    
    
    public func configVideoCell(_ videoConfig: VideoSource, playCallback:@escaping (_ source: String?) -> Void) {
        config = videoConfig
        backgroundImageView.image = UIImage.init(named: videoConfig.image)
        titleLable.text = videoConfig.title
        self.playCallback = playCallback
    }
    @IBAction func playButtonDidClick(_ sender: Any) {
        guard config != nil, playCallback != nil else {
            return
        }
        playCallback!(config!.source)
    }
}
