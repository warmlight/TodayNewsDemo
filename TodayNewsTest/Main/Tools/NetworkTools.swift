//
//  NetworkTools.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/3.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import MJRefresh
import AlamofireObjectMapper

class NetworkTools: NSObject {
    private override init() {
        
    }
    //单例
    static let shareNetworkTool = NetworkTools()
    
    //MARK:-首页顶部分类
    func loadHomeTitlesData(finished: (topTitles: [HomeTopTitle]) -> ()) {

        Alamofire.request(Router.homeCategory()).responseObject { (response: Response<HomeTopTitlesResponse, NSError>) in
            
            guard response.result.isSuccess else {
                SVProgressHUD.showErrorWithStatus("加载失败")
                print(response.result.error)
                return;
            }
            
            let titlesResponse = response.result.value
            
            if let titlesInfo = titlesResponse?.data?.topTitles {
                var titlesArr = [HomeTopTitle]()
                for title in titlesInfo {
                    titlesArr.append(title)
                }
        
                finished(topTitles: titlesArr)
            }
        }
    }
    
    
    //MARK:-新闻列表
    //刷新
    func refreshNewsList(category: String ,finished: (newsList: [NewsContent]?) -> ()) {
        newsList(Router.newsList(category), finished: finished)
    }
    
    //加载更多
    func moreNewsList(category: String, lastRefreshTime: NSTimeInterval, finished: (newsList: [NewsContent]?) -> ()) {
        newsList(Router.moreNewsList(category, lastRefreshTime), finished: finished)
    }
    
    func newsList(loadType: Router, finished: (newsList: [NewsContent]?) -> ()) {
        Alamofire.request(loadType).responseArray(keyPath: "data") { (response :Response<[NewsDetail], NSError>) in
            guard response.result.isSuccess else {
                SVProgressHUD.showErrorWithStatus("加载失败")
                print(response.result.error)
                return;
            }
            //返回的新闻列表里 新闻内容字段是josnString需要转化成object
            var newsArr = [NewsContent]()
            if let newsList = response.result.value as [NewsDetail]? {
                for news in newsList {
                    if let newsContent = NewsContent(JSONString: news.content!) as NewsContent? {
                        newsArr.append(newsContent)
                    }
                }
                finished(newsList: newsArr)
            }
        }

    }
    
}
