//
//  HomeTopTitle.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/3.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeTopTitle: Mappable {
    var category: String?

    var webUrl: String?

    var concernId: String?

    var iconUrl: String?

    var name: String?

    var isSelected: Bool = true
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        category <- map["category"]
        webUrl <- map["web_url"]
        name <- map["name"]
        iconUrl <- map["icon_url"]
        webUrl <- map["web_url"]
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
