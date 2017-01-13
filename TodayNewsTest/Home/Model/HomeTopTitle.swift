//
//  HomeTopTitle.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/3.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeTopTitle: CategoryTitle {
    var concernId: String?
    var isSelected: Bool = true
    
    required init?(_ map: Map) {
        super.init(map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map)
    }
}

class HomeTopTitlesAndVersion: Mappable {
    var version : String?
    var topTitles: [HomeTopTitle]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        version <- map["version"]
        topTitles <- map["data"]
    }
}

class HomeTopTitlesResponse : Mappable {
    var message : String?
    var data : HomeTopTitlesAndVersion?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
    }
}
