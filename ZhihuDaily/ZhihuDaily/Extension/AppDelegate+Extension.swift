//
//  AppDelegate+Extension.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

extension AppDelegate {
   class public func initializeRootViewController() -> MMDrawerController! {
        let nav = MainNavigationController(rootViewController: DailyHotNewsViewController())
        let rootViewController = MMDrawerController(center: nav, leftDrawerViewController: SlideMenuViewController())!
        rootViewController.openDrawerGestureModeMask = .all
        rootViewController.closeDrawerGestureModeMask = .all
        rootViewController.showsShadow = false
        rootViewController.maximumLeftDrawerWidth = UIScreen.main.bounds.size.width * 0.6
        rootViewController.setDrawerVisualStateBlock({ (drawerController, drawerSide, percentVisible) in
            if let visualBlock = MMDrawerVisualState.slideVisualStateBlock() {
                visualBlock(drawerController, drawerSide, percentVisible)
            }
        })
        return rootViewController
    }
    
    class public func delegate(_:Void) -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}
