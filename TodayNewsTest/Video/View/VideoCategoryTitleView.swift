//
//  VideoCategoryTitleView.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/13.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import ObjectMapper

class VideoCategoryTitleView: CategoryTitleView {
    init() {
        super.init(textColor:UIColor ( red: 0.2207, green: 0.1664, blue: 0.1573, alpha: 1.0 ), selectedTextColor: UIColor.blackColor(), needAddButton: false)
        weak var weakSelf = self
        NetworkTools.shareNetworkTool.vedioTitlesData { (topTitles) in
            let map = Map(mappingType: .FromJSON, JSONDictionary: [:])
            let hotCategory = VedioCategoryTitle.init(map)
            hotCategory?.name = "推荐"
            hotCategory?.category = "video"
            weakSelf?.titles.append(hotCategory!)
            if var videoTitlesArr = topTitles as [VedioCategoryTitle]? {
                videoTitlesArr += topTitles
                weakSelf?.titles = videoTitlesArr
            }
            weakSelf?.setupUI()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
