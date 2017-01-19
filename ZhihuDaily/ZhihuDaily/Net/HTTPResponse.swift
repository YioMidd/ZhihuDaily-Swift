//
//  HTTPResponse.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

struct HTTPResponse {
    
    var rawData: [String : Any]?
    var error: Error?

    func fetchDataWithReformer(_ reformer: Reformer?) -> Any {
        if reformer == nil {
            return rawData!
        }else {
            return reformer?.reformerWithResponse(self) ?? [:]
        }
    }
}
