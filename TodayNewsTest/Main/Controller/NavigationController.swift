//
//  NavigationController.swift
//  TodayNewsTest
//
//  Created by yiban on 17/1/5.
//  Copyright © 2017年 Lyy. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    //这个方法，是当这个类第一次被创建时调用，且只调用一次
    override class func initialize() {
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.whiteColor()
        navBar.tintColor = UIColor.whiteColor()
        navBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_28x28_"), style: .Plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    func navigationBack() {
        popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
