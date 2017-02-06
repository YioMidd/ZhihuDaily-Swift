//
//  Date.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

extension Date {
    
    var newsDateString: String {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return formatter.string(from: Date())
        }
    }
}
