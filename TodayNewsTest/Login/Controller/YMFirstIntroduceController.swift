//
//  YMFirstIntroduceController.swift
//  TodayNewsTest
//
//  Created by yiban on 16/12/30.
//  Copyright © 2016年 Lyy. All rights reserved.
//

import UIKit

class YMFirstIntroduceController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginClick(sender: UIButton) {
        print("登陆")
    }
    
    @IBAction func enterButtonClick(sender: UIButton) {
        print("点击进入按钮")
        //手动改变sb的rootController 一定要从bundle里取 不然显示不正确
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
        UIApplication.sharedApplication().keyWindow?.rootViewController = viewController;
    }
}
