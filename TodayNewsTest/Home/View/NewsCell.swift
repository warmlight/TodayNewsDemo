//
//  NewsCell.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/12.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    var news: NewsContent?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
