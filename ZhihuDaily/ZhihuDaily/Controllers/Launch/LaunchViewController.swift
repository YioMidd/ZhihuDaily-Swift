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
        backgroundColor = ym_HexRGBColor(0x101010)
        layer.cornerRadius = 10;
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.5
        
        // 中间的圈圈
        logoLayer = CAShapeLayer()
        logoLayer.strokeColor = UIColor.white.cgColor
        logoLayer.fillColor = UIColor.clear.cgColor
        logoLayer.lineWidth = 4.5
        logoLayer.lineCap = kCALineCapRound
        logoLayer.strokeEnd = 0
        layer.addSublayer(logoLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLogoAnimation() {
        let arcCenter = CGPoint(x: self.width / 2.0, y: self.height / 2.0)
        CATransaction.begin()
        CATransaction.setAnimationDuration(2.5)
        let path = UIBezierPath(arcCenter: arcCenter, radius: self.width * 0.25, startAngle: CGFloat(M_PI) * 2.5 / 5.0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        logoLayer.path = path.cgPath
        logoLayer.strokeEnd = 1
        CATransaction.commit()
    }
}

class LaunchViewController: UIViewController {
    
    // MARK: Private Property
    fileprivate var logoAnimateView = LogoAnimateView()
    private var backgroundImageView: UIImageView!
    private var bottomView = UIView()
    private var bottomConstraint: Constraint?
    private let bottomViewHeight: CGFloat = 100
    private var launchImageDict: Dictionary<String, Any> = [:]
    private var imageCopyRightLabel: UILabel = {
        let label = UILabel()
        label.font = TextFont12Size
        label.textColor = ym_HexRGBColor(0xdddddd)
        label.text = " "
        label.alpha = 0
        return label
    }()
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ym_HexRGBColor(0x131313)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        launchImageDict = LaunchImageLoader().getLaunchImageDict()
        self.initializeChildsView()
        
        delay(2.75) {
            self.animatedHide()
        }
    }
    
    // MARK: Public API
    func showin(parent: UIViewController) {
        parent.addChildViewController(self)
        self.view.frame = parent.view.frame
        parent.view.addSubview(self.view)
        self.didMove(toParentViewController: parent)
        delay(0.15) {
            self.animatedShow()
        }
    }
    
    // MARK: Private API
    @objc fileprivate func animatedShow() {
        UIView.animate(withDuration: 0.25, animations: {
            // Refresh Layout
            self.bottomConstraint?.update(offset: ym_ScreenHeight - self.bottomViewHeight)
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.75, animations: {
                self.backgroundImageView.alpha = 1
                self.imageCopyRightLabel.alpha = 1
            })
            
            self.logoAnimateView.startLogoAnimation()
        }
    }
    
    @objc fileprivate func animatedHide() {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0
            self.view.layer.zPosition = 10
            self.view.layer.setAffineTransform(CGAffineTransform(scaleX: 1.1, y: 1.1))
        })
        NotificationCenter.default.post(name: .StatusBarApperanceChangeNotification, object: nil, userInfo: [Notification.key.StatusBarStateHideNotificationUserInfoKey : false])
        NotificationCenter.default.post(name: .StatusBarApperanceChangeNotification, object: nil, userInfo: [Notification.key.StatusBarStyleLightContentNotificationUserInfoKey : UIStatusBarStyle.lightContent])
    }
    
    // MARK: Initalize ChildViews
    private func initializeChildsView() {
        let logoViewSize = CGSize(width: 50, height: 50)
        
        bottomView.backgroundColor = ym_HexRGBColor(0x101010)
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (maker) in
            maker.left.right.equalToSuperview()
            maker.height.equalTo(bottomViewHeight)
            bottomConstraint = maker.top.equalToSuperview().offset(ym_ScreenHeight).constraint
        }
        
        bottomView.addSubview(logoAnimateView)
        logoAnimateView.snp.makeConstraints { (maker) in
            maker.size.equalTo(logoViewSize)
            maker.left.equalToSuperview().offset(25)
            maker.centerY.equalToSuperview()
        }
        
        let appNameLabel = UILabel()
        appNameLabel.textColor = UIColor.white
        appNameLabel.text = "知乎..."
        appNameLabel.font = TextFont18Size
        bottomView.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(logoAnimateView.snp.right).offset(8)
            maker.top.equalTo(logoAnimateView.snp.top)
        }
        
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = ym_HexRGBColor(0xcccccc)
        descriptionLabel.text = "每天三次，每次七..."
        descriptionLabel.font = TextFont16Size
        bottomView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(appNameLabel.snp.left)
            maker.bottom.equalTo(logoAnimateView.snp.bottom)
        }
        
        backgroundImageView = UIImageView()
        backgroundImageView.image = launchImageDict[UserDefaultLaunchImageKey] as? UIImage
        backgroundImageView.alpha = 0
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        self.view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { (maker) in
            maker.top.left.right.equalToSuperview()
            maker.bottom.equalToSuperview().offset(-bottomViewHeight)
        }
        
        imageCopyRightLabel.text = launchImageDict[UserDefaultLaunchImageCopyRightKey] as? String
        backgroundImageView.addSubview(imageCopyRightLabel)
        imageCopyRightLabel.snp.makeConstraints { (maker) in
            maker.centerX.equalToSuperview()
            maker.bottom.equalToSuperview().inset(5)
        }
    }
}


