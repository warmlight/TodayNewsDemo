//
//  ScrollTitleView.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/3.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import ObjectMapper
import Kingfisher
import SnapKit

class ScrollTitleView: CategoryTitleView {
    
    init() {
        super.init(textColor: .hexStringToColor("#ffe0e4"), selectedTextColor: UIColor.whiteColor(), needAddButton: true)

        weak var weakSelf = self
        NetworkTools.shareNetworkTool.loadHomeTitlesData { (topTitles) in
            let map = Map(mappingType: .FromJSON, JSONDictionary: [:])
            let hotCategory = HomeTopTitle.init(map)
            var homeTitlesArr: [HomeTopTitle] = [HomeTopTitle]()
            hotCategory?.name = "推荐"
            hotCategory?.category = "__all__"
            homeTitlesArr.append(hotCategory!)
            if var _ = topTitles as [HomeTopTitle]? {
                homeTitlesArr += topTitles
                weakSelf?.titles = homeTitlesArr
            }            
            weakSelf?.setupUI()
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}