//
//  VideoCategoryTitle.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/12.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import ObjectMapper

class CategoryTitle: Mappable {
    var category: String?
    var webUrl: String?
    var iconUrl: String?
    var name: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        category <- map["category"]
        webUrl <- map["web_url"]
        name <- map["name"]
        iconUrl <- map["icon_url"]
    }
}

class VedioCategoryTitle: CategoryTitle {
    var flags: Int?
    var type: Int?
    var tipNew: Int?
    
    required init?(_ map: Map) {
        super.init(map)
    }

    override func mapping(map: Map) {
        super.mapping(map)

        flags <- map["flags"]
        type <- map["type"]
        tipNew <- map["tip_new"]
    }
}