//
//  HomeVideoController.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/12.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

class HomeVideoController: UIViewController {
    var oldIndex : Int = 0
    var homeTopTitles : [VedioCategoryTitle]? {
        didSet {
//            showCurrentCategoryListView(labelTag: 0)
        }
    }
    
    lazy var titleView: VideoCategoryTitleView = {
        return $0
    }(VideoCategoryTitleView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        homeTopTitleViewCallBack()
    }
    
    private func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        navigationItem.titleView = titleView
    }
}
