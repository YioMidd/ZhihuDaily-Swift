//
//  NewsDetailContentViewController.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/9.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit
import WebKit
import FDFullscreenPopGesture

class NewsDetailContentViewController: UIViewController, WKNavigationDelegate, UIScrollViewDelegate {

    
    var webView = WKWebView(frame: CGRect(x: 0, y: 200, width: ym_ScreenWidth, height: ym_ScreenHeight - 200))
//    var scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ym_ScreenWidth, height: ym_ScreenHeight))
    var modalTransition: ModalInteractiveTransition!
    var contentData: [String : Any]! {
        didSet {
            self.webView.loadHTMLString(self.contentData[HotNewsDetailContentKeyHTML] as! String, baseURL: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        print("销毁了...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
        modalTransition = ModalInteractiveTransition(controller: self)
        view.addSubview(webView)
        
        let imageView = UIImageView()
        
        imageView.sd_setImage(with: URL(string: "http://pic1.zhimg.com/b8da0fb5a7ce75d788ed0749cd393870.jpg"), placeholderImage: R.image.image_Preview())
        let headerView = NewsImageHeaderView(size: CGSize(width: ym_ScreenWidth, height: 200), maxContentOffsetY: -60, containSubView: imageView)
        view.addSubview(<#T##view: UIView##UIView#>)
//        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
        
//        scrollView.clipsToBounds = false
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints { (maker) in
//            maker.left.right.bottom.equalToSuperview()
//            maker.top.equalToSuperview().offset(200)
//        }
        
//        webView.navigationDelegate = self
//        webView.scrollView.contentInset = UIEdgeInsetsMake(-200, 0, 0, 0)
//        webView.scrollView.delegate = self
//        view.addSubview(webView)
//        webView.scrollView.contentInset = UIEdgeInsetsMake(-200, 0, 0, 0)
//        webView.snp.makeConstraints { (maker) in
//            maker.top.equalToSuperview().offset(0)
//            maker.left.right.bottom.equalToSuperview()
//            maker.centerX.equalToSuperview()
//            maker.height.equalTo(ym_ScreenHeight - 200)
//        }
        
//        let temp = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 200))
//        temp.backgroundColor = UIColor.red
//        webView.scrollView.addSubview(temp)
//        temp.snp.makeConstraints { (maker) in
//            maker.left.top.right.equalToSuperview()
//            maker.height.equalTo(120)
//        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView: \(scrollView)   contentOffset:  \(scrollView.contentOffset.y)")
    }
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        scrollView.contentSize = webView.scrollView.contentSize
//    }

}
