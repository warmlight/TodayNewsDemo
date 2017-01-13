//
//  UITableView+Extension.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/12.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

extension UITableView {
    func showEmptyContent(rowCount: Int) {
        guard rowCount <= 0 else {
            backgroundView = nil
            separatorStyle = .SingleLine
            return
        }
        
        let bgView = UIView()
        bgView.frame = self.frame
        let imgView = UIImageView()
        imgView.image = UIImage(named: "not_network_loading_226x119_")
        imgView.contentMode = .Center
        bgView.addSubview(imgView)
        backgroundView = imgView
        separatorStyle = .None
    }
}