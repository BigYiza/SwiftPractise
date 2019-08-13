//
//  ViewController.swift
//  Swift_30Day_5
//
//  Created by ZhangYi on 2019/3/19.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // 访问权限分w5种：private，fileprivate，internal，public 和 open
    // private：只能在本类的作用域且在当前文件内能访问
    // fileprivate：只能在当前文件内能访问
    // internal：本module内能访问
    // public：跨module访问但不能重写或继承
    // open：跨module访问并且能重写或继承
    // 如果你不知道什么是module 👉 https://stackoverflow.com/questions/48426344/what-does-module-mean-in-swift?rq=1
    fileprivate var interests = Interest.createInterests()

}

