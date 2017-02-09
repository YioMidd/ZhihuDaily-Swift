//
//  NewsSectionDateHeaderView.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/8.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class NewsSectionDateHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        let backView = UIView(frame: self.bounds)
        backView.backgroundColor = NavBarColor
        self.backgroundView = backView
        
        self.textLabel?.textColor = UIColor.white
        self.textLabel?.font = TextFont13Size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.centerX = self.width/2;
    }
}
