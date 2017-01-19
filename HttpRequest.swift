//
//  HttpRequest.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/7.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation
import Alamofire


struct HTTPRequest: Request {
    let url: String
    let method: HttpMethod
    let parameters: [String : Any]?
    
}
