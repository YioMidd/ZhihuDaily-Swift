//
//  RequestProtocol.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case GET
    case POST
}

protocol Request {
    var url: String {get}
    var method: HttpMethod {get}
    var parameters: [String : Any]? {get}
    
}
