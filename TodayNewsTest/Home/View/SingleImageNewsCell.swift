//
//  SingleImageNewsCell.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/11.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

class SingleImageNewsCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var publishTimeLabel: UILabel!
    
    var news: NewsContent {
        get {
            return self.news
        }
        set {
            titleLabel.text = newValue.title ?? ""
            sourceLabel.text = newValue.source ?? ""
            commentCountLabel.text = "\(newValue.commentCount ?? 0)评论"
            if let time = newValue.publishTime {
                let timeInterval = NSTimeInterval(time)
                let timeDate = NSDate(timeIntervalSince1970: timeInterval)
                publishTimeLabel.text = timeAgoSince(timeDate)
            }
            let urlString = newValue.middleImage?.url
            newsImageView.kf_setImageWithURL(.newsImageUrl(urlString!))
        }
    }
}
