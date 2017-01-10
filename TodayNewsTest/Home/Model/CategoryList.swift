//
//  CategoryList.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/6.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit
import ObjectMapper

class NewsDetail: Mappable {
    var content: String?
    var code: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        code <- map["code"]
    }
}


class NewsContent: Mappable {
    var readCount: Int?
    var mediaName: String?
    var hasVideo: Bool?
    var abstract: String?
    var articleType: Int?
    var tag: String?
    var keywords: String?
    var videoDuration: Int?
    var cellType: Int?
    var title: String?
    var shareUrl: String?
    var hasMp4Video: Int?
    var source: String?
    var commentCount: Int?
    var articleUrl: String?
    var publishTime: Int?
    var gallaryImgCount: Int?
    var cellLayoutStyle: Int?
    var videoStyle: Int?
    var displayUrl: String?
    var cellFlag: Int?
    var likeCount: Int?
    var diggCount: Int?
    var imageList: [ImageList]?
    var mediaInfo: MediaInfo?
    var middleImage: ImageList?
    var largeimageList: [ImageList]?
    
    required init?(_ map: Map) {
    
    }
    
    func mapping(map: Map) {
        readCount <- map["read_count"]
        mediaName <- map["media_name"]
        hasVideo <- map["has_video"]
        abstract <- map["abstract"]
        articleType <- map["article_type"]
        tag <- map["tag"]
        keywords <- map["keywords"]
        videoDuration <- map["video_duration"]
        cellType <- map["cell_type"]
        title <- map["title"]
        shareUrl <- map["share_url"]
        hasMp4Video <- map["has_mp4_video"]
        source <- map["source"]
        commentCount <- map["comment_count"]
        articleUrl <- map["article_url"]
        publishTime <- map["publish_time"]
        gallaryImgCount <- map["gallary_image_count"]
        cellLayoutStyle <- map["cell_layout_style"]
        videoStyle <- map["video_style"]
        displayUrl <- map["display_url"]
        cellFlag <- map["cell_flag"]
        likeCount <- map["like_count"]
        diggCount <- map["digg_count"]
        imageList <- map["image_list"]
        mediaInfo <- map["media_info"]
        middleImage <- map["middle_image"]
        largeimageList <- map["large_image_list"]
    }
}

extension NewsContent: CustomStringConvertible {
    var description: String {
        return " readCount = \(readCount)\n mediaName = \(mediaName)\n hasVideo = \(hasVideo) \nabstract = \(abstract) \narticleType = \(articleType) \nshareUrl = \(shareUrl) \ncommentCount = \(commentCount) \npublishTime = \(publishTime) \nlikeCount = \(likeCount) \ndiggcount = \(diggCount)\n -----------------------\n "
    }
}

class ImageList: Mappable {
    var url: String?
    var width: Int?
    var height: Int?
    var uri: String?
    var urlList: [UrlList]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        width <- map["width"]
        height <- map["height"]
        urlList <- map["url_list"]
    }
}

extension ImageList: CustomStringConvertible {
    var description: String {
        return " url = \(url)\n width = \(width)\n height = \(height) \n urlList = \(urlList) \n-----------------------\n "
    }
}

class UrlList: Mappable {
    var url: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
    }
}

class MediaInfo: Mappable {
    var userId: Int?
    var verifiedContent: String?
    var avatarUrl: String?
    var mediaId: Int?
    var name: String?
    var recommendType: Int?
    var follow: Bool?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId  <- map["user_id"]
        verifiedContent <- map["verified_content"]
        avatarUrl <- map["avatar_url"]
        mediaId <- map["media_id"]
        name <- map["name"]
        recommendType <- map["recommend_type"]
        follow <- map["follow"]
    }
}

extension MediaInfo: CustomStringConvertible {
    var description: String {
        return "avatar = \(avatarUrl)\n name = \(name)\n userId = \(userId)\n ---------------------\n"
    }
}

