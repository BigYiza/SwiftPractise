//
//  LeftViewController.swift
//  Swift_30Day_4
//
//  Created by ZhangYi on 2019/2/26.
//  Copyright © 2019 ZhangYi. All rights reserved.
//

import Foundation
import UIKit


class LeftViewController: UIViewController {
    public func viewController() -> LeftViewController {
        let storyBoard = UIStoryboard.init(name: "SubViewControllers", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        return viewController
    }
}

class rightViewController: UIViewController {
    public func viewController() -> rightViewController {
        let storyBoard = UIStoryboard.init(name: "SubViewControllers", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "rightViewController") as! rightViewController
        return viewController
    }
}

class centerViewController: UIViewController {
    
    
}

