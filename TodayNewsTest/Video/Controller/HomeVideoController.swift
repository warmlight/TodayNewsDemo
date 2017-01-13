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
    
    var videoTopTitles : [VedioCategoryTitle]? {
        didSet {
            showCurrentCategoryListView(labelTag: 0)
        }
    }
    
    lazy var titleView: VideoCategoryTitleView = {
        return $0
    }(VideoCategoryTitleView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        homeTopTitleViewCallBack()
    }
    
    private func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        navigationItem.titleView = titleView
    }
    
    private func homeTopTitleViewCallBack() {
        //通过分类标签的数量来添加各个分类下的控制器
        titleView.titleArrayClosure { [weak self] (titleArray) in
            for title in titleArray {
                let categoryVC = VideoCategoryListController()
                categoryVC.topCategoryTitle = title as? VedioCategoryTitle
                categoryVC.view.backgroundColor = .randomColor()
                self?.addChildViewController(categoryVC)
            }
            self?.videoTopTitles = titleArray as? [VedioCategoryTitle]
        }
        
        //点击了哪一个titleLabel 滚动到相应的地方
        titleView.didSelectedTitleLabelClosure { [weak self] (titleLabel) in
            self?.showCurrentCategoryListView(labelTag: titleLabel.tag)
        }
    }
    
    //显示分类的view
    func showCurrentCategoryListView(labelTag index: Int) {
        //取出控制器添加到当前视图上
        if let vc = (childViewControllers[index] as UIViewController?) {
            view.addSubview(vc.view)
        }
    }
}
