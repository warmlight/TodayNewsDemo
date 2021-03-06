//
//  ThreeImagesNewsCell.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/11.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import Kingfisher

class ThreeImagesNewsCell: UITableViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var publishTimeLabel: UILabel!
    
    var newsImagesArr: [UIImageView]?
    
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
            setNewsImage(newValue.imageList)
        }
    }
    
    override func awakeFromNib() {
        newsImagesArr = [firstImageView, secondImageView, thirdImageView]
    }
    
    func setNewsImage(images: [ImageList]?) {
        if let newsImgs = images {
            for (index, img) in newsImgs.enumerate() {
                newsImagesArr![index].kf_setImageWithURL(.newsImageUrl(img.url!))
            }
        }
    }
}
