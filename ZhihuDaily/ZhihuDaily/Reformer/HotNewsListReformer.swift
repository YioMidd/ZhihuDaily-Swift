//
//  HotNewsListReformer.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

import Foundation

let HotNewsListDataKeyDate = "HotNewsListDataKeyDate"
let HotNewsListDataKeyStories = "HotNewsListDataKeyStories"
let HotNewsListDataKeyTopStories = "HotNewsListDataKeyTopStories"
let HotNewsListDataKeyImages = "HotNewsListDataKeyImages"
let HotNewsListDataKeyImage = "HotNewsListDataKeyImage"
let HotNewsListDataKeyType = "HotNewsListDataKeyType"
let HotNewsListDataKeyId = "HotNewsListDataKeyId"
let HotNewsListDataKeyGaPrefix = "HotNewsListDataKeyGaPrefix"
let HotNewsListDataKeyMultipic = "HotNewsListDataKeyMultipic"
let HotNewsListDataKeyTitle = "HotNewsListDataKeyTitle"

struct HotNewsListReformer: Reformer {
    func reformerWithResponse(_ response: HTTPResponse) -> Any {
        let originDict = response.rawData!
        var hotNewsDict = Dictionary<String, Any>()
        var hotNewsArray = Array<Any>()
        
        hotNewsDict[HotNewsListDataKeyDate] = originDict["date"]
        for item in originDict["stories"] as! [[String : Any]] {
            var itemDict = Dictionary<String, Any>()
            itemDict[HotNewsListDataKeyId] = item["id"]
            itemDict[HotNewsListDataKeyImages] = item["images"] ?? []
            itemDict[HotNewsListDataKeyType] = item["type"]
            itemDict[HotNewsListDataKeyGaPrefix] = item["ga_prefix"]
            if item["multipic"] != nil {
                itemDict[HotNewsListDataKeyMultipic] =  item["multipic"]
            }
            itemDict[HotNewsListDataKeyTitle] = item["title"]
            hotNewsArray.append(itemDict)
        }
        hotNewsDict[HotNewsListDataKeyStories] = hotNewsArray
        return hotNewsDict
    }
}


struct HotNewsTopListReformer: Reformer {
    func reformerWithResponse(_ response: HTTPResponse) -> Any {
        let originDict = response.rawData!
        var hotNewsTopDict = Dictionary<String, Any>()
        var hotNewsTopArray = Array<Any>()
        
        hotNewsTopDict[HotNewsListDataKeyDate] = originDict["date"]
        for item in originDict["top_stories"] as! [[String : Any]] {
            var itemDict = Dictionary<String, Any>()
            itemDict[HotNewsListDataKeyId] = item["id"]
            itemDict[HotNewsListDataKeyImage] = item["image"]
            itemDict[HotNewsListDataKeyType] = item["type"]
            itemDict[HotNewsListDataKeyGaPrefix] = item["ga_prefix"]
            itemDict[HotNewsListDataKeyTitle] = item["title"]
            hotNewsTopArray.append(itemDict)
        }
        hotNewsTopDict[HotNewsListDataKeyTopStories] = hotNewsTopArray
        return hotNewsTopDict
    }
}


//{
//    "date": "20170118",
//    "stories": [
//    {
//    "images": [
//    "http://pic4.zhimg.com/abe723fa1b542d1b05361f33dbc13d1b.jpg"
//    ],
//    "type": 0,
//    "id": 9158869,
//    "ga_prefix": "011818",
//    "multipic": true,
//    "title": "税务局如何知道企业是否偷税漏税？"
//    }, ....],
//    "top_stories": [
//    {
//    "image": "http://pic2.zhimg.com/84f667f332ebdd06779a02ee2dcb8691.jpg",
//    "type": 0,
//    "id": 9158470,
//    "ga_prefix": "011815",
//    "title": "看过《最后的晚餐》，但没看得这么细，也没想这么多"
//    }]
//}
