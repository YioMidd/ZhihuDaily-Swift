//
//  LaunchViewController.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/14.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit
import SnapKit

private class LogoAnimateView: UIView {
    
    var logoLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
        layer.cornerRadius = 5;
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2.5
        
        logoLayer = CAShapeLayer()
        logoLayer.strokeColor = UIColor.white.cgColor
        logoLayer.fillColor = UIColor.clear.cgColor
        logoLayer.lineWidth = 4
        logoLayer.lineCap = kCALineCapRound
        logoLayer.strokeEnd = 0
        layer.addSublayer(logoLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startLogoAnimation( ) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.5)
        let path = UIBezierPath(arcCenter: self.center, radius: 8, startAngle: CGFloat(M_PI) / 5.0, endAngle: CGFloat(M_PI) * 4.0 / 5.0, clockwise: true)
        logoLayer.path = path.cgPath
        logoLayer.strokeEnd = 1
        CATransaction.commit()
    }
}

class LaunchViewController: UIViewController {

    fileprivate var logoAnimateView = LogoAnimateView()
    var bottomConstraint: Constraint?
    var imageCopyRightLabel: UILabel = {
        let label = UILabel()
        label.font = TextFont12Size
        label.textColor = ym_HexRGBColor(0xdddddd)
        label.text = "© Fido Dido"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        initializeChildsView()
    }

    private func initializeChildsView() {
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.black
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (maker) in
            maker.left.right.equalToSuperview()
            maker.height.equalTo(50)
            bottomConstraint = maker.bottom.equalToSuperview().inset(-50).constraint
        }
        
        bottomView.addSubview(logoAnimateView)
        logoAnimateView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: 20, height: 20))
            maker.left.equalToSuperview().offset(15)
            maker.centerY.equalToSuperview()
        }
        
        let appNameLabel = UILabel()
        appNameLabel.textColor = UIColor.white
        appNameLabel.text = "知乎..."
        appNameLabel.font = TextFont16Size
        bottomView.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(logoAnimateView.snp.right).offset(8)
            maker.top.equalTo(logoAnimateView.snp.top)
        }
        
        let descriptionLabel = UILabel()
        descriptionLabel.font = TextFont14Size
        descriptionLabel.textColor = ym_HexRGBColor(0xcccccc)
        descriptionLabel.text = "每天三次，每次七..."
        bottomView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(appNameLabel.snp.left)
            maker.bottom.equalTo(logoAnimateView.snp.bottom)
        }
        
        let backgroundImageView = UIImageView()
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        self.view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.bottom.equalTo(bottomView.snp.top)
        }
        
        backgroundImageView.addSubview(imageCopyRightLabel)
        imageCopyRightLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.bottom.equalToSuperview().inset(5)
        }
    }
}


