//
//  Notification.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/20.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

extension Notification.Name {
    /// StatusBar
    static let StatusBarApperanceChangeNotification = Notification.Name(rawValue: "StatusBarApperanceChangeNotification")
}

extension Notification {
    public struct key {
        /// StatusBar
        static let StatusBarStateHideNotificationUserInfoKey = "StatusBarStateHideNotificationUserInfoKey"
        static let StatusBarStyleDefaultNotificationUserInfoKey = "StatusBarStyleDefaultNotificationUserInfoKey"
        static let StatusBarStyleLightContentNotificationUserInfoKey = "StatusBarStyleLightContentNotificationUserInfoKey"
    }
}
