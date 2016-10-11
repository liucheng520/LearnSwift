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

        tabBar.tintColor = UIColor.init(red: 60/255.0, green: 164/255.0, blue: 181/255.0, alpha: 1.0)
        let frist : FirstViewController = FirstViewController.init()
        let nav : UINavigationController = UINavigationController.init(rootViewController: frist)
        nav.navigationBar.backgroundColor = UIColor.green
        frist.title = "第一个"
        addChildViewController(nav)
        
        frist.tabBarItem = UITabBarItem.init(title: "第一个", image: UIImage.init(named: "tab_homePage")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage.init(named: "tab_homePage_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
       
    }
}
