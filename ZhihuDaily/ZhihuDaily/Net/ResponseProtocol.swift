//
//  ResponseProtocol.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/18.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

protocol Decodable {
    static func parse(data: Data) -> Reformer?
}

