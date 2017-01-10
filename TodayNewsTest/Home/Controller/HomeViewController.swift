//
//  HomeViewController.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/3.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var oldIndex : Int = 0
    var homeTopTitles : [HomeTopTitle]? {
        didSet {
            showCurrentCategoryListView(labelTag: 0)
        }
    }
    
    lazy var titleView: ScrollTitleView = {
        return $0
    }(ScrollTitleView())
    
    //等同于上面的写法
    //    lazy var titleView : ScrollTitleView = {
    //        var titleView = ScrollTitleView()
    //        return titleView
    //    }()
    
    lazy var scrollView: UIScrollView = {
        $0.frame = UIScreen.mainScreen().bounds
        $0.pagingEnabled = true
        $0.delegate = self
        return $0
    }(UIScrollView())
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        homeTopTitleViewCallBack()
    }
    
    private func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.barTintColor = .hexStringToColor("#d65b5c")
        navigationItem.titleView = titleView
    }

    private func homeTopTitleViewCallBack() {
        //通过分类标签的数量来添加各个分类下的控制器 设置滚动视图的contentsize
        titleView.titleArrayClosure { [weak self] (titleArray) in
            for title in titleArray {
                let categoryVC = HomeCategoryListController()
                categoryVC.topCategoryTitle = title
//                categoryVC.view.backgroundColor = .randomColor()
                self?.addChildViewController(categoryVC)
            }
            self?.homeTopTitles = titleArray
        }
        
        //点击添加按钮后弹出添加分类的模态视图
        titleView.addButtonClickClosure { [weak self] in
            let addCategoryVC = UIViewController()
            addCategoryVC.view.backgroundColor = .randomColor()
            let nav = UINavigationController(rootViewController: addCategoryVC)
            self?.presentViewController(nav, animated: true, completion: nil)
        }
        
        //点击了哪一个titleLabel 滚动到相应的地方
        titleView.didSelectedTitleLabelClosure { [weak self] (titleLabel) in
            self?.showCurrentCategoryListView(labelTag: titleLabel.tag)
        }
    }
    
    //显示分类的view
    func showCurrentCategoryListView(labelTag index: Int) {
        //取出控制器添加到当前滚动视图上
        if let vc = (childViewControllers[index] as UIViewController?) {
            view.addSubview(vc.view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UIScrollViewDelegate {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
