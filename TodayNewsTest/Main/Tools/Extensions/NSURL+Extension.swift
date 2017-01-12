
//
//  UIImageView+Extension.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/11.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

extension NSURL {
    static func newsImageUrl(urlString: String) -> NSURL{
        let range = urlString.rangeOfString(".webp")
        guard let _ = range else {
            return NSURL(string: urlString)!
        }
        let url = urlString.substringToIndex(range!.startIndex)
        let URL = NSURL(string: url)!
        return URL
    }
}