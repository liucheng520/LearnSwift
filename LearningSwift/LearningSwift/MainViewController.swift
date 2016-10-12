//
//  MainViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/11.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = DEFCOLOR_A(r: 60, g: 164, b: 181, a: 1.0)
        let frist : FirstViewController = FirstViewController.init()
        let nav : BaseNaviController = BaseNaviController.init(rootViewController: frist)
        frist.title = "第一个"
        addChildViewController(nav)
        
        frist.tabBarItem = UITabBarItem.init(title: "第一个", image: UIImage.init(named: "tab_homePage")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tab_homePage_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
       
    }
}
