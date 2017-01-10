//
//  URLRequestConvertible.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/5.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import Alamofire

enum Router: URLRequestConvertible {
    
    case homeCategory()
    case newsList(String)
    case moreNewsList(String, NSTimeInterval)
    
    
    var URLRequest: NSMutableURLRequest {
        
        //MARK:-请求方法
        var method: Alamofire.Method {
            switch self {
            case .homeCategory:
                return .GET
            case .newsList:
                return .GET
            case .moreNewsList:
                return .GET
            }
        }
        
        //代码效果同上
//        var method: Alamofire.Method {
//            get {
//                switch self {
//                case .homeCategory():
//                    return .GET
//                }
//            }
//        }
        
        //用闭包初始化常量
        //MARK:-请求参数
        let params : ([String : AnyObject]?) = {
            switch self {
            case .homeCategory:
                return ["device_id": device_id, "aid": 13, "iid": IID]
            case .newsList(let category):
                return ["device_id": device_id, "category": category, "iid": IID]
            case .moreNewsList(let category, let timeInterval):
                return ["device_id": device_id, "category": category, "iid": IID, "last_refresh_sub_entrance_interval": timeInterval]
            }
        }()
        
        //MARK:-请求路径
        let url : NSURL = {
            let relativePath : String?
            switch self {
            case .homeCategory():
                relativePath = "article/category/get_subscribed/v1"
            case .newsList, .moreNewsList:
                relativePath = "api/news/feed/v39/"
            }
            
            var fullUrl = NSURL(string: BASE_URL)!
            if let relativePath = relativePath {
                fullUrl = fullUrl.URLByAppendingPathComponent(relativePath)
            }
            
            return fullUrl
        }()
        
        let URLRequest = NSMutableURLRequest(URL: url)
        let encoding = Alamofire.ParameterEncoding.URL
        let (encodedRequest, _) = encoding.encode(URLRequest, parameters: params)
        print(encodedRequest.URLString)
        
        encodedRequest.HTTPMethod = method.rawValue
        
        return encodedRequest
    }
}
