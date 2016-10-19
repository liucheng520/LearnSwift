//
//  ImagePreViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/18.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class ImagePreViewController: UIViewController {

    var scrollView : ImagePreScrollView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor =  UIColor.white
        scrollView = ImagePreScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        scrollView.imgUrl = "videoScreenshot01"
        view .addSubview(scrollView)
        
        let visualTest : UIVisualEffectView = UIVisualEffectView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        visualTest.isUserInteractionEnabled = false
        visualTest.alpha = 0.3
        let effect : UIBlurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.light)
        visualTest.effect = effect
        view.addSubview(visualTest)
    }
}
