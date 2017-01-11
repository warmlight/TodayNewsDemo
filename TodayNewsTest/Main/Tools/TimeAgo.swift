
//
//  File.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/10.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import Foundation

public func timeAgoSince(timeDate: NSDate) -> String {
    let now = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let unitFlags: NSCalendarUnit = [.Second, .Minute, .Hour, .Day, .WeekOfYear, .Month, .Year]
    let components = (calendar as NSCalendar).components(unitFlags, fromDate: timeDate, toDate: now, options: [])
    
    if  components.year >= 2 {
        return "\(components.year) years ago"
    }
    
    if components.year >= 1 {
        return "去年"
    }
    
    if components.month >= 1 {
        return "\(components.month)个月前"
    }
    
    if components.weekOfYear >= 1 {
        return "\(components.weekOfYear)周前"
    }
    
    if components.year >= 1 || components.month >= 1 || components.weekOfYear >= 1 || components.day >= 1 {
        
    }
    
    if components.hour >= 1 {
        return "\(components.hour)小时前"
    }
    
    if components.minute >= 1 {
        return "\(components.minute)分钟前"
    }
    
    return "刚刚"
}