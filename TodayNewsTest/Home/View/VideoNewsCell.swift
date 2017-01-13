//
//  VideoNewsCell.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/11.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import Kingfisher

class VideoNewsCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var publishTimeLabel: UILabel!
    @IBOutlet weak var videoTimeLabel: UILabel!

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
            let urlString = newValue.videoDetailInfo?.detailVideoLargeImage?.url
            videoImageView.kf_setImageWithURL(.newsImageUrl(urlString!))
            videoTimeLabel.text = videoDurationTime(newValue.videoDuration!)
        }
    }
    
    func videoDurationTime(time: Int) -> String {
        let minute = Int(time / 60)
        let second = time % 60
        return String(format: "%02d:%02d", minute, second)
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
