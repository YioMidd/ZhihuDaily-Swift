//
//  NewsImageHeaderView.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/7.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

@objc public protocol NewsImageHeaderViewDelegate: class{
    // 限制ScrollView的最大下拉距离
    @objc optional func headerView(_ headerView: NewsImageHeaderView, lockScrollWithOffset maxOffset: CGFloat) -> Void
}

public class NewsImageHeaderView: UIView {
    
    weak public var delegate: NewsImageHeaderViewDelegate?
    
    var subView: UIView
    var contentView = UIView()
    var maxContenOffsetY: CGFloat
    
    init(size:CGSize, maxContentOffsetY offsetY: CGFloat, containSubView subView: UIView) {
        self.subView = subView
        maxContenOffsetY = offsetY < 0 ? offsetY : -offsetY
        super.init(frame: CGRect(origin: CGPoint.zero, size: size))
        
        self.clipsToBounds = false
        contentView.clipsToBounds = true
        contentView.frame = self.bounds
        self.addSubview(contentView)
        contentView.addSubview(subView)
        subView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func layoutHeaderViewWithScrollOffset(_ offset: CGPoint) -> Void {
        let delta = offset.y
        if delta < maxContenOffsetY {
            guard self.delegate != nil else {
                return
            }
            delegate?.headerView?(self, lockScrollWithOffset: maxContenOffsetY)
        }else if delta < 0 {
            contentView.y += delta
            contentView.height += abs(delta)
        }
    }
}
