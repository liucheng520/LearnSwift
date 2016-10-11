//
//  FirstViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/11.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        //2016-10-11
        
        let timeLabel : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 64, width: 375, height: 200))
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.backgroundColor = UIColor.black
        timeLabel.textColor = UIColor.white
        view.addSubview(timeLabel)
        
        let resetBtn : UIButton = UIButton.init(type: UIButtonType.custom)
        resetBtn.setTitle("reset", for: UIControlState.normal)
        
        resetBtn.frame = CGRect.init(x: 0, y: 64, width: 375, height: 20)
        resetBtn.backgroundColor = UIColor.black
        view.addSubview(resetBtn)
        resetBtn.addTarget(self, action: #selector(FirstViewController.reset), for: UIControlEvents.touchUpInside)
        
        
        let startBtn : UIButton = UIButton.init(type: UIButtonType.custom)
        startBtn.setTitle("start", for: UIControlState.normal)
        
        startBtn.frame = CGRect.init(x: 0, y: 270, width: 175.5, height: 50)
        startBtn.backgroundColor = UIColor.green
        view.addSubview(startBtn)
        startBtn.addTarget(self, action: #selector(FirstViewController.start), for: UIControlEvents.touchUpInside)
        
        let holdBtn : UIButton = UIButton.init(type: UIButtonType.custom)
        holdBtn.setTitle("hold", for: UIControlState.normal)
        holdBtn.frame = CGRect.init(x: 175.5, y: 270, width: 175.5, height: 50)
        view.addSubview(holdBtn)
        holdBtn.backgroundColor = UIColor.red
        holdBtn.addTarget(self, action: #selector(FirstViewController.hold), for: UIControlEvents.touchUpInside)
        
    }

    func reset() -> Void {
        
    }
    
    func start() -> Void {
        
    }
    
    func hold() -> Void {
        
    }

}
