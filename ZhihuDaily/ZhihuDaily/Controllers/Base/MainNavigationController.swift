//
//  MainNavigationController.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    private var statusBarStateHide: Bool = true
    private var statusBarStyle: UIStatusBarStyle = .lightContent
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleAttributes = [NSForegroundColorAttributeName : UIColor.white,
                               NSFontAttributeName : NavTitleFont]
        self.navigationBar.titleTextAttributes = titleAttributes
        self.navigationBar.shadowImage = UIImage()
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
    
    override var childViewControllerForStatusBarHidden: UIViewController? {
        return self.topViewController
    }
}
