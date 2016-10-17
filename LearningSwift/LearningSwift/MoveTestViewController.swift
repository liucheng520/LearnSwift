//
//  MoveTestViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/15.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class MoveTestViewController: UIViewController {

    var scrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createSubviews()
        
    }
    
    func createSubviews() -> Void{
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        let leftVc : LeftViewController = LeftViewController.init()
        addChildViewController(leftVc)
        leftVc.didMove(toParentViewController: self)
        
        let centerVc : CenterViewController = CenterViewController.init()
        addChildViewController(centerVc)
        centerVc.didMove(toParentViewController: self)
        
        let rightVc : RightViewController = RightViewController.init()
        addChildViewController(rightVc)
        rightVc.didMove(toParentViewController: self)
        
        scrollView.addSubview(leftVc.view)
        scrollView.addSubview(centerVc.view)
        scrollView.addSubview(rightVc.view)
        
        leftVc.view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight);
        centerVc.view.frame = CGRect.init(x: kScreenWidth, y: 0, width: kScreenWidth, height: kScreenHeight);
        rightVc.view.frame = CGRect.init(x: kScreenWidth * 2, y: 0, width: kScreenWidth, height: kScreenHeight);
        
        scrollView.contentSize = CGSize.init(width: kScreenWidth * 3, height: 0)
    }

}
