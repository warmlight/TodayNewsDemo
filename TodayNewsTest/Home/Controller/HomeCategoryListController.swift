//
//  HomeCategoryListControllerTableViewController.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/6.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import MJRefresh

//let noImageNewsCell = "NoImageNewsCell"
//let threeImagesNewsCell = "ThreeImagesNewsCell"
//let vedioNewsCell = "VideoNewsCell"
//let singleImageCell = "SingleImageNewsCell"

class HomeCategoryListController: NewCategoryListController {
//    var lastSelectedTabIndex: Int?
//    var topCategoryTitle: HomeTopTitle?
//    
//    private var newsArr = [NewsContent]()
//    private var pullRefreshTime: NSTimeInterval?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        initUI()
//        setUpRefreshUI()
//
//    }
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        getNetworkData()
//    }
//    
//    private func getNetworkData() {
//        //闭包中self不可以省略,懒加载中也不可以省略
//        NetworkTools.shareNetworkTool.refreshNewsList((topCategoryTitle?.category)!) { [weak self] (newsList) in
//            self?.pullRefreshTime = NSDate().timeIntervalSince1970
//            self?.tableView.mj_header?.endRefreshing()
//            self?.newsArr = newsList!
//            self?.tableView.reloadData()
//        }
//    }
//    
//    private func initUI() {
//        self.definesPresentationContext = true //当搜索框弹出时是否覆盖当前的视图控制器
//        tableView.frame = CGRectMake(0, 64, SCREENW, SCREENH - (64 + 49))
//        let noImageCellNib = UINib(nibName: noImageNewsCell, bundle: nil)
//        let threeImagesCellNib = UINib(nibName: threeImagesNewsCell, bundle: nil)
//        let vedioCellNib = UINib(nibName: vedioNewsCell, bundle: nil)
//        let singleImageNib = UINib(nibName: singleImageCell, bundle: nil)
//
//        //从nib加载cell 要和xib里cell的identifier一致
//        tableView.registerNib(noImageCellNib, forCellReuseIdentifier: noImageNewsCell)
//        tableView.registerNib(threeImagesCellNib, forCellReuseIdentifier: threeImagesNewsCell)
//        tableView.registerNib(vedioCellNib, forCellReuseIdentifier: vedioNewsCell)
//        tableView.registerNib(singleImageNib, forCellReuseIdentifier: singleImageCell)
//
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableViewAutomaticDimension
//        //切换tabbar
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(tabBarSelected), name: TabBarDidSelectedNotification, object: nil)
//    }
//    
//    //上拉 下拉回调
//    func setUpRefreshUI() {
//        weak var weakSelf = self
//        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
//            weakSelf?.getNetworkData()
//        })
//        
//        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
//            NetworkTools.shareNetworkTool.moreNewsList((weakSelf?.topCategoryTitle?.category)!, lastRefreshTime: (weakSelf?.pullRefreshTime)!, finished: { (newsList) in
//                weakSelf?.tableView.mj_footer.endRefreshing()
//                if newsList?.count > 0 {
//                    weakSelf?.newsArr = (weakSelf?.newsArr)! + newsList!
//                }
//                weakSelf?.tableView.reloadData()
//            })
//        })
//    }
//    
//    func tabBarSelected() {
//        if lastSelectedTabIndex == tabBarController?.selectedIndex {
////            tableView.mj_header.beginRefreshing()
//        }
//        lastSelectedTabIndex = tabBarController!.selectedIndex
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension HomeCategoryListController {
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        tableView.showEmptyContent(newsArr.count)
//        print(newsArr.count)
//        return newsArr.count
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let news = newsArr[indexPath.row]
//        //3图
//        if let newsImageList = news.imageList where newsImageList.count == 3 {
//            let cell = tableView.dequeueReusableCellWithIdentifier(threeImagesNewsCell) as! ThreeImagesNewsCell
//            cell.news = news
//            return cell
//        //video
//        } else if let isVideo = news.hasVideo where isVideo{
//            let cell = tableView.dequeueReusableCellWithIdentifier(vedioNewsCell) as! VideoNewsCell
//            cell.news = news
//            return cell
//        
//        //单图
//        } else if let _ = news.middleImage?.url where news.imageList?.count == 0 {
//            print("-----------------------------------\(news.hasVideo)")
//            let cell = tableView.dequeueReusableCellWithIdentifier(singleImageCell) as! SingleImageNewsCell
//            cell.news = news
//            return cell
//        //无图
//        } else {
//            let cell = tableView.dequeueReusableCellWithIdentifier(noImageNewsCell) as! NoImageNewsCell
//            cell.news = news
//            return cell
//        }
//    }
//}
