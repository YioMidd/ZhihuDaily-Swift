//
//  NewsItemCell.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/12.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit
import SnapKit

class NewsItemCell: UITableViewCell {

    var titleLabel: UILabel!
    var thumbnailImageView: UIImageView!
    var titleLabelToImageViewConstraint: Constraint!
    var titleLabelToSuperViewConstraint: Constraint!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        thumbnailImageView = UIImageView()
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 75, height: 60))
            maker.right.equalToSuperview().offset(10)
            maker.centerY.equalToSuperview()
        }
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.font = NewsTitleFont
        titleLabel.textColor = NewsTitleColor
        titleLabel.text = "sSSSGewqrtbzbfmbjkwgrgiu2qgtjgbkjbzmsfrserweersfdsfawerfasfwthtykjuili;'b"
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.left.equalTo(20)
            titleLabelToImageViewConstraint = maker.right.equalTo(thumbnailImageView).inset(10).priority(UILayoutPriorityDefaultHigh).constraint
            titleLabelToSuperViewConstraint = maker.right.equalToSuperview().inset(20).priority(UILayoutPriorityRequired).constraint
            
            if thumbnailImageView.image == nil{
                titleLabelToImageViewConstraint.update(priority: UILayoutPriorityDefaultHigh)
                titleLabelToSuperViewConstraint.update(priority: UILayoutPriorityRequired)
            }
        }
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = SeperatorViewColor
        contentView.addSubview(seperatorView)
        seperatorView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(15)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview()
            maker.height.equalTo(0.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

