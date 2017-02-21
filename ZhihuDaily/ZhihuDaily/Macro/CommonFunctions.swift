//
//  CommonFunctions.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation
import UIKit

var ym_ScreenBounds: CGRect {
    return UIScreen.main.bounds
}

var ym_ScreenSize: CGSize {
    return UIScreen.main.bounds.size
}

var ym_ScreenWidth: CGFloat {
    return UIScreen.main.bounds.size.width
}

var ym_ScreenHeight: CGFloat {
    return UIScreen.main.bounds.size.height
}

func ym_RGBColor(_ red: CGFloat,  _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
}

func ym_RGBAColor(_ red: CGFloat,  _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

func ym_HexRGBColor(_ hex: Int) -> UIColor {
    return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: 1.0)
}

func ym_HexRGBAColor(_ hex: Int, _ alpha: CGFloat) -> UIColor {
    return UIColor(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(hex & 0x0000FF) / 255.0, alpha: alpha)
}

func ym_RandomColor() -> UIColor {
    return UIColor(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1.0)
}

func ym_FormateDateString(_ dateString: String) -> String {
    let startIndex = dateString.index(dateString.startIndex, offsetBy: 4)
    let endIndex = dateString.index(dateString.startIndex, offsetBy: 6)
    let year = dateString.substring(with: dateString.startIndex..<startIndex)
    let month = dateString.substring(with: startIndex..<endIndex)
    var day = dateString.substring(with: endIndex..<dateString.endIndex)
    
    let weekDays: Array<String> = [" ", "日", "一", "二", "三", "四", "五", "六"]
    var dateComponent = DateComponents()
    let calender = Calendar.current
    dateComponent.year = Int(year)
    dateComponent.month = Int(month)
    dateComponent.day = Int(day)
    let date: Date = calender.date(from: dateComponent)!
    let weekDay = calender.component(.weekday, from: date)
    
    if day.hasPrefix("0") {
        day.remove(at: day.startIndex)
    }
    return month + "月" + day + "日" + "  星期" + weekDays[weekDay]
}
