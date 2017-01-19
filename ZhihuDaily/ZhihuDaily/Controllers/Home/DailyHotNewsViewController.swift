//
//  DailyHotNewsViewController.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/6.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit
import SnapKit

class DailyHotNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewsImageHeaderViewDelegate, SDCycleScrollViewDelegate {
    
    fileprivate let originOffset: CGFloat = -64.0
    fileprivate let scrollDistance: CGFloat = 185.0
    fileprivate var hotNewsSource: Array = Array<Any>()
    fileprivate var cycleScrollView: SDCycleScrollView?
    fileprivate var hideStatusBar: Bool = true {
        didSet {
            self.setNeedsStatusBarAppearanceUpdate()
            self.navigationController?.navigationBar.isHidden = self.hideStatusBar
        }
    }
    fileprivate lazy var headerView: NewsImageHeaderView = {
        let headerViewHeight: CGFloat = 94
        let maxContentOffsetY: CGFloat = 110.0
        self.cycleScrollView = SDCycleScrollView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: ym_ScreenWidth, height: headerViewHeight)), delegate: self, placeholderImage: nil) as SDCycleScrollView
        self.cycleScrollView?.backgroundColor = UIColor.clear
        self.cycleScrollView?.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated
        self.cycleScrollView?.autoScrollTimeInterval = 6.0;
        self.cycleScrollView?.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        self.cycleScrollView?.bannerImageViewContentMode = .scaleAspectFill
        self.cycleScrollView?.titleLabelTextFont = TextFont16Size
        self.cycleScrollView?.titleLabelBackgroundColor = UIColor.clear
        self.cycleScrollView?.titleLabelHeight = 60
        
        let headerView: NewsImageHeaderView = NewsImageHeaderView(size: CGSize(width: ym_ScreenWidth, height: headerViewHeight), maxContentOffsetY: maxContentOffsetY, containSubView: self.cycleScrollView!)
        headerView.delegate = self
        return headerView
    }()
    
    fileprivate lazy var newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 85
        tableView.register(NewsItemCell.self, forCellReuseIdentifier: NSStringFromClass(NewsItemCell.self))
        tableView.tableHeaderView = self.headerView
        return tableView
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return hideStatusBar
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return hideStatusBar ? .slide : .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: UIColor.clear)
        self.navigationController?.navigationBar.isHidden = true
        self.title = "今日热闻"
        
        view.addSubview(newsTableView)
        newsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        newsTableView.tableHeaderView = headerView
        
        // 提前加载数据
        loadHotNews()
        // 展示启动欢迎界面
        addLaunchView()
    }
}

// MARK: tableView dataSource
extension DailyHotNewsViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotNewsSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(NewsItemCell.self), for: indexPath) as! NewsItemCell
        itemCell.configCellWithData(hotNewsSource[indexPath.row] as! [String : Any])
        return itemCell
    }
}

// MARK: tableView delegate
extension DailyHotNewsViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= originOffset {
            self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: NavBarColor.withAlphaComponent(0))
        }else {
            let alpha = min(1.0, (scrollView.contentOffset.y - originOffset) / scrollDistance)
            self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: NavBarColor.withAlphaComponent(alpha))
        }
        
        print("\(scrollView.contentOffset.y)")
        let heardView = newsTableView.tableHeaderView as! NewsImageHeaderView
        heardView.layoutHeaderViewWithScrollOffset(scrollView.contentOffset)
    }
}

// MARK: headerView delegate
extension DailyHotNewsViewController {
    
    func headerView(_ headerView: NewsImageHeaderView, lockScrollWithOffset maxOffset: CGFloat) {
        newsTableView.contentOffset.y = maxOffset
    }
}

// MARK: Private
extension DailyHotNewsViewController {
    
    /// MARK: Network Request
    fileprivate func loadHotNews() {
        HTTPRequestClient().send(HTTPRequest(url: url_latestNews(), method: .GET, parameters: nil)) { (response) in
            if let _ = response.rawData {
                let hotNewsData = response.fetchDataWithReformer(HotNewsListReformer()) as! Dictionary<String, Any>
                self.reloadHotNews(hotNewsData[HotNewsListDataKeyStories] as! Array<[String : Any]>)
                
                let hotNewsTopData = response.fetchDataWithReformer(HotNewsTopListReformer()) as! Dictionary<String, Any>
                self.reloadHotNewsTop(hotNewsTopData[HotNewsListDataKeyTopStories] as! Array<[String : Any]>)
            }
        }
    }
    
    private func reloadHotNews(_ sourceData: Array<[String : Any]>) {
        self.hotNewsSource = sourceData
        self.newsTableView.reloadData()
    }
    
    private func reloadHotNewsTop(_ sourceData: Array<[String : Any]>) {
        var images = Array<String>()
        var titles = Array<String>()
        for dict in sourceData {
            let imageUrlString = dict[HotNewsListDataKeyImage] as! String
            let title = dict[HotNewsListDataKeyTitle] as! String
            images.append(imageUrlString)
            titles.append(title)
        }
        self.cycleScrollView?.imageURLStringsGroup = images
        self.cycleScrollView?.titlesGroup = titles
    }
    
    /// MARK: Add ChildVC
    fileprivate func addLaunchView() {
        let launchVC = LaunchViewController()
        launchVC.showin(parent: self)
        
        delay(3.5) { 
            launchVC.hide {
                self.hideStatusBar = false
            }
        }
    }
}
