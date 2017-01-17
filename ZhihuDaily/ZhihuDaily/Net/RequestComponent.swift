//
//  RequestComponent.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/16.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

public enum RequestType: String {
    case get
    case post
}

public typealias Parameters = [String: Any]

public class RequestComponent: NSObject {

    public var url: String!
    public var parameters: Parameters?
    public var requestType: RequestType! 

    init(url: String,  type: RequestType = .get, parameters: Parameters? = nil) {
        super.init()
        self.requestType = type
        self.url = url
        self.parameters = parameters
    }
}
