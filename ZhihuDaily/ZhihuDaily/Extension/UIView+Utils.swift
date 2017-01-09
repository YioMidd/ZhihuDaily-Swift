//
//  UIView+Utils.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

extension UIView {
    var x: CGFloat  {
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.origin.x
        }
    }
    
    var maxX: CGFloat  {
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.width
            self.frame = frame
        }
        
        get {
            return self.frame.origin.x + self.width
        }
    }
    
    var y: CGFloat  {
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.origin.y
        }
    }
    
    var maxY: CGFloat  {
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.height
            self.frame = frame
        }
        
        get {
            return self.frame.origin.y + self.height
        }
    }

    var width: CGFloat  {
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.size.width
        }
    }
    
    var height: CGFloat  {
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.size.height
        }
    }

    var centerX: CGFloat  {
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
        
        get {
            return self.center.x
        }
    }
    
    var centerY: CGFloat  {
        set {
            self.center = CGPoint(x: self.center.y, y: newValue)
        }
        
        get {
            return self.center.y
        }
    }
    
    var size: CGSize  {
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
        
        get {
            return self.frame.size
        }
    }
    
}
