//
//  RequestAPI.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/1/7.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import Foundation

/// 启动界面图像获取
///
/// - parameter pixWidth:     图像分辨率-宽.
/// - parameter pixHeight:    图像分辨率-高.
///  e.g. 1080*1776
public func url_launchImage(_ pixWidth: Int, _ pixHeight: Int) -> String {
    return "http://news-at.zhihu.com/api/4/start-image/" + String(pixWidth) + "*" + String(pixHeight)
}

/// 软件版本查询
///
/// - parameter currentVersion:     当前版本
///  e.g. 2.3.0
public func url_versionCheck(_ currentVersion: String) -> String {
    return "http://news-at.zhihu.com/api/4/version/ios/" + currentVersion
}

/// 获取最新新闻
public func url_latestNews( ) -> String {
    return "http://news-at.zhihu.com/api/4/news/latest"
}

/// 新闻内容获取与离线下载
///
/// - parameter newsId:     “最新新闻”中获得的新闻对应ID
public func url_newsDetail(_ newsId: String) -> String {
    return "http://news-at.zhihu.com/api/4/news/" + newsId
}

/// 过往新闻
///
/// - parameter date:     日期   格式：20170107
/// 若要查询 1 月 6 日的新闻，before 后的数字应为 20170107
/// NOTE: 输入的今日之后的日期仍然获得今日内容
public func url_newsBefore(_ date: String) -> String {
    return "http://news-at.zhihu.com/api/4/news/before/" + date
}

/// 新闻额外信息，如评论数量，所获的『赞』的数量。
///
/// - parameter newsId:     新闻对应ID
public func url_newsExtraInfo(_ newsId: String) -> String {
    return "http://news-at.zhihu.com/api/4/story-extra/" + newsId
}

/// 新闻对应长评论查看
///
/// - parameter newsId:     新闻对应ID
public func url_newsLongComments(_ newsId: String) -> String {
    return String.init(format: "http://news-at.zhihu.com/api/4/story/\(newsId)/long-comments")
}

/// 新闻对应短评论查看
///
/// - parameter newsId:     新闻对应ID
public func url_newsShortComments(_ newsId: String) -> String {
    return "http://news-at.zhihu.com/api/4/story/\(newsId)/short-comments"
}

/// 主题日报列表查看
public func url_themesList( ) -> String {
    return "http://news-at.zhihu.com/api/4/themes"
}

/// 主题日报内容查看
public func url_themeNews(_ themeId: String) -> String {
    return "http://news-at.zhihu.com/api/4/theme/" + themeId
}

/// 热门新闻
public func url_hotNews() -> String {
    return "http://news-at.zhihu.com/api/3/news/hot"
}

/// 栏目总览
public func url_sections() -> String {
    return "http://news-at.zhihu.com/api/3/sections"
}

/// 栏目具体新闻查看
///
/// - parameter sectionId:     栏目对应ID
public func url_newsOfSection(_ sectionId: String) -> String {
    return "http://news-at.zhihu.com/api/3/section/" + sectionId
}

/// 查看新闻的推荐者
///
/// - parameter newsId:     新闻对应ID
public func url_recommendersOfNews(_ newsId: String) -> String {
    return "http://news-at.zhihu.com/api/4/story/\(newsId)/recommenders"
}

/// 获取某个专栏之前的新闻
///
/// - parameter sectionId:     栏目对应ID
/// - parameter time:             时间戳
public func url_newsOfSectionBefore(_ sectionId: String, _ time: Double) -> String {
    return "http://news-at.zhihu.com/api/4/section/\(sectionId)/before/\(String(time))"
}
