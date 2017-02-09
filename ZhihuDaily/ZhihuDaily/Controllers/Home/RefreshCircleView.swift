//
//  RefreshCircleView.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/8.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class RefreshCircleView: UIView {

    var refresh: Bool = false {
        didSet {
            if refresh {
                startAnimating()
            }else {
                stopAnimating()
            }
        }
    }
    
    fileprivate let activityView = UIActivityIndicatorView(activityIndicatorStyle: .white)
    fileprivate var arcPoint: CGPoint?
    lazy private var circleBottomLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.gray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeStart = 0
        layer.strokeEnd = 1
        layer.path = UIBezierPath(arcCenter: self.arcPoint!, radius: self.width * 0.5, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true).cgPath
        return layer
    }()
    lazy private var circleTopLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let arcPath = UIBezierPath(arcCenter: self.arcPoint!, radius: self.width * 0.5, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI * 2 + M_PI_2), clockwise: true)
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 1.4
        layer.path = arcPath.cgPath
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 1.0
        layer.strokeEnd = 0
        return layer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        arcPoint = CGPoint(x: self.width * 0.5, y: self.height * 0.5)
        self.addSubview(activityView)
        activityView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        self.layer.addSublayer(circleBottomLayer)
        self.layer.addSublayer(circleTopLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // percent: 0.0 to 1.0
    func redraw(progress: CGFloat) {
        guard !refresh else {
            return
        }
        
        if progress > 0.05 {
            circleBottomLayer.isHidden = false
            circleTopLayer.isHidden = false
        }else {
            circleBottomLayer.isHidden = true
            circleTopLayer.isHidden = true
        }
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.05)
        circleTopLayer.strokeEnd = progress
        CATransaction.commit()
    }
    
    private func startAnimating() {
        circleTopLayer.isHidden = true
        circleBottomLayer.isHidden = true
        activityView.startAnimating()
    }
    
    private func stopAnimating() {
        activityView.stopAnimating()
    }

}
