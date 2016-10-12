//
//  BaseNaviController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/12.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class BaseNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
            viewController.hidesBottomBarWhenPushed = true;
        }
        
        super.pushViewController(viewController, animated: true)
    }

    public override class func initialize(){
        setUpNavifationBarTheme()
    }
    
    class func setUpNavifationBarTheme() -> Void{
        let navigationBar : UINavigationBar = UINavigationBar.appearance()
        navigationBar.backgroundColor = UIColor.green
    }
    
}
