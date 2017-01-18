//
//  MainNavigationController.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let titleAttributes = [NSForegroundColorAttributeName : UIColor.white,
                               NSFontAttributeName : TextFont14Size]
        self.navigationBar.titleTextAttributes = titleAttributes
    }
    
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
}
