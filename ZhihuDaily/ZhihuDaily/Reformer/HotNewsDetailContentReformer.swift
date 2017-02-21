//
//  HotNewsDetailContentReformer.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/10.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

let HotNewsDetailContentKeyHTML = "HotNewsDetailContentKeyHTML"
let HotNewsDetailContentKeyImageSource = "HotNewsDetailContentKeyImageSource"
let HotNewsDetailContentKeyJS = "HotNewsDetailContentKeyJS"  // array
let HotNewsDetailContentKeyId = "HotNewsDetailContentKeyId"
let HotNewsDetailContentKeyGaPrefix = "HotNewsDetailContentKeyGaPrefix"
let HotNewsDetailContentKeyTitle = "HotNewsDetailContentKeyTitle"
let HotNewsDetailContentKeyImage = "HotNewsDetailContentKeyImage"
let HotNewsDetailContentKeyShareURL = "HotNewsDetailContentKeyShareURL"

let HotNewsDetailContentKeySection = "HotNewsDetailContentKeySection" // dict
let HotNewsDetailContentKeySectionThumbnail = "HotNewsDetailContentKeySectionThumbnail"
let HotNewsDetailContentKeySectionId = "HotNewsDetailContentKeySectionId"
let HotNewsDetailContentKeySectionName = "HotNewsDetailContentKeySectionName"


struct HotNewsDetailContentReformer: Reformer {
    func reformerWithResponse(_ response: HTTPResponse) -> Any {
        let originDict = response.rawData!
        var resultDict = Dictionary<String , Any>()
        resultDict[HotNewsDetailContentKeyId] = originDict["id"]
        resultDict[HotNewsDetailContentKeyGaPrefix] = originDict["ga_prefix"]
        resultDict[HotNewsDetailContentKeyImageSource] = originDict["image_source"]
        resultDict[HotNewsDetailContentKeyTitle] = originDict["title"]
        resultDict[HotNewsDetailContentKeyImage] = originDict["image"]
        resultDict[HotNewsDetailContentKeyJS] = originDict["js"]
        resultDict[HotNewsDetailContentKeyShareURL] = originDict["share_url"]
        resultDict[HotNewsDetailContentKeySection] = originDict["section"]
        let css = originDict["css"] as! Array<String>
//        <link type='text/css' rel='stylesheet' href = \(css.first!) ></link>
        resultDict[HotNewsDetailContentKeyHTML] = "<html><head><meta name='viewport' content='initial-scale=1.0,user-scalable=no' /><link type='text/css' rel='stylesheet' href = \(css.first!) ></link></head><body>\(originDict["body"] as! String)</body></html>"
        return resultDict
    }
}
