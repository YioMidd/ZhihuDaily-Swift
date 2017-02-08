//
//  NewsSectionDateCell.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class NewsSectionDateCell: UITableViewCell {
    private var dateLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dateLabel = UILabel()
        dateLabel.backgroundColor = NavBarColor
        dateLabel.font = TextFont15Size
        dateLabel.textColor = UIColor.white
        dateLabel.textAlignment = .center
        self.contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCellWithData(_ data: String) {
        dateLabel.text = data
    }
}
