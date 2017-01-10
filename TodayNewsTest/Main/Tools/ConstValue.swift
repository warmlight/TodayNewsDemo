//
//  ConstValue.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/3.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

/// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
/// 可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
/// 替换成自己的，再进行测试
let IID: String = "5034850950"
let device_id: String = "6096495334"
let version_code = "5.7.1"
/// 服务器地址
let BASE_URL = "http://lf.snssdk.com/"

/// 屏幕的宽
let SCREENW = UIScreen.mainScreen().bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.mainScreen().bounds.size.height

//==============通知
let TabBarDidSelectedNotification = "tabBarDidSelectedNotification"