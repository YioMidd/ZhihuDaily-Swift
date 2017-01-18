//
//  ReformerProtocol.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

protocol Reformer {
    func reformerWithResponse(_ response: HTTPResponse) -> Any
}
