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
    lazy var tableView = UITableView()
    let headerViewHeight:CGFloat = 154
    
    func LockScorllView(_ maxOffsetY: CGFloat) {
        self.tableView.contentOffset.y = maxOffsetY
    }
    
    func autoAdjustNavigationBarAplha(_ aplha: CGFloat) {
        self.navigationController?.navigationBar.lt_setElementsAlpha(alpha: aplha)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.lt_setBackgroundColor(backgroundColor: NavBarColor)
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let cycleScrollView = SDCycleScrollView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: ym_ScreenWidth, height: headerViewHeight)), delegate: self, placeholderImage: nil) as SDCycleScrollView
        cycleScrollView.infiniteLoop = true
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated
        cycleScrollView.autoScrollTimeInterval = 6.0;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic
        cycleScrollView.titleLabelTextFont = UIFont(name: "STHeitiSC-Medium", size: 21)
        cycleScrollView.titleLabelBackgroundColor = UIColor.clear
        cycleScrollView.titleLabelHeight = 60

        let headerView: NewsImageHeaderView = NewsImageHeaderView(size: CGSize(width: ym_ScreenWidth, height: 154), maxContentOffsetY: 100, containSubView: cycleScrollView)
        headerView.delegate = self
        tableView.tableHeaderView = headerView
    }
}


// MARK: tableView dataSource
extension DailyHotNewsViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = String.init(format: "cell --- %lu", indexPath.row)
        return cell
    }
    
}

// MARK: tableView delegate
extension DailyHotNewsViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let heardView = tableView.tableHeaderView as! NewsImageHeaderView
        heardView.layoutHeaderViewWithScrollOffset(scrollView.contentOffset)
    }
}

// MARK: headerView delegate
extension DailyHotNewsViewController {
    
    func headerView(_ headerView: NewsImageHeaderView, lockScrollWithOffset maxOffset: CGFloat) {
        tableView.contentOffset.y = maxOffset
    }
}
