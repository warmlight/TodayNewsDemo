//
//  NoImageNewsCell.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/10.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

class NoImageNewsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var publishTime: UILabel!
    
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
                publishTime.text = timeAgoSince(timeDate)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
