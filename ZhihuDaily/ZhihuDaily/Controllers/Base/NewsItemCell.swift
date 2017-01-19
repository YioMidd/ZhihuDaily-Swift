//
//  NewsItemCell.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/12.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class NewsItemCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var thumbnailImageView: UIImageView!
    private var morePicImageView: UIImageView!
    private var titleLabelToImageViewConstraint: Constraint!
    private var titleLabelToSuperViewConstraint: Constraint!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        thumbnailImageView = UIImageView()
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 75, height: 60))
            maker.right.equalToSuperview().inset(10)
            maker.centerY.equalToSuperview()
        }
        
        morePicImageView = UIImageView()
        morePicImageView.image = R.image.home_Morepic()
        thumbnailImageView.addSubview(morePicImageView)
        morePicImageView.snp.makeConstraints { (maker) in
            maker.bottom.right.equalToSuperview()
            maker.size.equalTo(CGSize(width: 32, height: 14))
        }
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.font = TextFont13Size
        titleLabel.textColor = NewsTitleColor
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.left.equalTo(10)
            titleLabelToImageViewConstraint = maker.right.equalTo(thumbnailImageView.snp.left).inset(-15).priority(UILayoutPriorityRequired).constraint
            titleLabelToSuperViewConstraint = maker.right.equalToSuperview().inset(-10).priority(UILayoutPriorityDefaultHigh).constraint
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
    
    
    func configCellWithData(_ data: [String : Any]) {
        titleLabel.text = data[HotNewsListDataKeyTitle] as? String
        let images = data[HotNewsListDataKeyImages] as! Array<String>
        if data[HotNewsListDataKeyMultipic] != nil {
            morePicImageView.isHidden = false
        }else {
            morePicImageView.isHidden = true
        }
        if images.count != 0 {
            thumbnailImageView.isHidden = false
            thumbnailImageView.sd_setImage(with: URL(string: images.first!))
            titleLabelToImageViewConstraint.update(priority: UILayoutPriorityRequired)
            titleLabelToSuperViewConstraint.update(priority: UILayoutPriorityDefaultHigh)
        }else {
            thumbnailImageView.isHidden = true
            titleLabelToImageViewConstraint.update(priority: UILayoutPriorityDefaultHigh)
            titleLabelToSuperViewConstraint.update(priority: UILayoutPriorityRequired)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

