//
//  ViewController.swift
//  Swift_30Day_2
//
//  Created by ZhangYi on 2019/2/19.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLable: UILabel!
    var fontIndex: NSInteger = 0;
    let fontSource = ["MFTongXin_Noncommercial-Regular",
                      "MFJinHei_Noncommercial-Regular",
                      "MFZhiHei_Noncommercial-Regular",
                      "Zapfino",
                      "Gaspar Regular"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Swift_30Day_2"
        /*
         字体引入项目却设置不成功？
         检查下info.plist中为引入的注册了么？如下：
         
         <?xml version="1.0" encoding="UTF-8"?>
         <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
         <plist version="1.0">
         <array>
         <string>Gaspar Regular.otf</string>
         <string>MFJinHei_Noncommercial-Regular.ttf</string>
         <string>MFTongXin_Noncommercial-Regular.ttf</string>
         <string>MFZhiHei_Noncommercial-Regular.ttf</string>
         </array>
         </plist>

         */
        self.textLable.font = UIFont.init(name: fontSource[fontIndex], size: 17.0)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func changeFontButtonDidClicl(_ sender: Any) {
        fontIndex = (fontIndex + 1) % 5;
        self.textLable.font = UIFont.init(name: fontSource[fontIndex], size: 17.0)
    }
    
}

