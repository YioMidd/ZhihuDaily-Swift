//
//  HttpRequest.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/7.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation
import Alamofire

public class HttpRequest: NSObject {

    public var completionHandler: ((ResponseComponent) -> Void)?
    
    init(requestComponent: RequestComponent) {
        completionHandler = nil
        super.init()
        startRequest(requestComponent)
    }
    
    func response(_ completionHandler: @escaping (ResponseComponent) -> Void) -> Void {
        self.completionHandler = completionHandler
    }
    
    private func startRequest(_ requestComponent: RequestComponent) {
        var method: HTTPMethod
        let type: RequestType = requestComponent.requestType
        switch type {
        case .get:
            method = .get
        case .post:
            method = .post
        }
        Alamofire.request(requestComponent.url, method: method).responseJSON { (response) in
            if response.result.error == nil, let value = response.result.value {
                self.completionHandler!(ResponseComponent(resultValue: value as? [String : Any], error: nil))
            }else {
                self.completionHandler!(ResponseComponent(resultValue: nil, error: response.result.error))
            }
        }
    }
}
