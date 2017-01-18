//
//  ClientProtocol.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

protocol Client {
    func send<T: Request>(_ request: T, handler: @escaping (HTTPResponse) -> Void)
}
