//
//  NavTitleView.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/7.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class NavTitleView: UIView {

    let titleLabel = UILabel()
    var refreshView: RefreshCircleView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.font = NavTitleFont
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        refreshView = RefreshCircleView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        refreshView.centerY = self.height * 0.5
        self.addSubview(refreshView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    }
