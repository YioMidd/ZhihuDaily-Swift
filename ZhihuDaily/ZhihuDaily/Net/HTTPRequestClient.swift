//
//  HTTPRequestClient.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation
import Alamofire

struct HTTPRequestClient: Client{
    func send<T : Request>(_ request: T, handler: @escaping (HTTPResponse) -> Void) {
        let method: HTTPMethod = HTTPMethod(rawValue: request.method.rawValue)!
        Alamofire.request(request.url, method: method, parameters: request.parameters).responseJSON { (response) in
            if let data = response.result.value {
                handler(HTTPResponse(rawData: data as? [String : Any], error: nil))
            }else {
                handler(HTTPResponse(rawData: nil, error: response.result.error))
            }
        }
    }
}
