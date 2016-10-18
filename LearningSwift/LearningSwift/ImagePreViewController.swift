//
//  ImagePreViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/18.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class ImagePreViewController: UIViewController {

    var scrollView : UIScrollView!
    var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        scrollView.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
        scrollView.backgroundColor = UIColor.black
        view .addSubview(scrollView)
        
        imageView = UIImageView.init()
        scrollView.addSubview(imageView)
    }
    
    public func setImgUrl(imgUrl:String) -> Void {
        
        
    }
    
}
