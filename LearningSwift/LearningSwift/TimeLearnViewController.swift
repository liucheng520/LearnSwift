//
//  TimeLearnViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/12.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class TimeLearnViewController: UIViewController {

    
    var timer : Timer = Timer()  //定时器
    var Counter : Float = 0.0    //记时
    var IsPlaying : Bool = false
    var timeLabel : UILabel!
    var resetBtn : UIButton!
    var startBtn : UIButton!
    var holdBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化时间显示
        view.backgroundColor = UIColor.white
        
        //2016-10-11
        
        timeLabel = UILabel.init(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: 200))
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.backgroundColor = UIColor.black
        timeLabel.textColor = UIColor.white
        view.addSubview(timeLabel)
        timeLabel.text = String(Counter)
        
        
        resetBtn = UIButton.init(type: UIButtonType.custom)
        resetBtn.setTitle("reset", for: UIControlState.normal)
        
        resetBtn.frame = CGRect.init(x: 0, y: 64, width: kScreenWidth, height: 20)
        resetBtn.backgroundColor = UIColor.black
        view.addSubview(resetBtn)
        resetBtn.addTarget(self, action: #selector(TimeLearnViewController.reset), for: UIControlEvents.touchUpInside)
        
        
        startBtn = UIButton.init(type: UIButtonType.custom)
        startBtn.setTitle("start", for: UIControlState.normal)
        
        startBtn.frame = CGRect.init(x: 0, y: 270, width: kScreenWidth * 0.5, height: 50)
        startBtn.backgroundColor = UIColor.green
        view.addSubview(startBtn)
        startBtn.addTarget(self, action: #selector(TimeLearnViewController.start), for: UIControlEvents.touchUpInside)
        
        holdBtn = UIButton.init(type: UIButtonType.custom)
        holdBtn.setTitle("hold", for: UIControlState.normal)
        holdBtn.frame = CGRect.init(x: kScreenWidth * 0.5, y: 270, width: kScreenWidth * 0.5, height: 50)
        view.addSubview(holdBtn)
        holdBtn.backgroundColor = UIColor.red
        holdBtn.addTarget(self, action: #selector(TimeLearnViewController.hold), for: UIControlEvents.touchUpInside)
    }

    func reset() -> Void {
        timer.invalidate()
        IsPlaying = false
        Counter = 0.0
        timeLabel.text = String(Counter)
        startBtn.isEnabled = true
        holdBtn.isEnabled = true
    }
    
    func start() -> Void {
        
        if IsPlaying {
            return
        }
        
        startBtn.isEnabled = false
        holdBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(TimeLearnViewController.countTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    
    func hold() -> Void {
        
        if !IsPlaying {
            return
        }
        startBtn.isEnabled = true
        holdBtn.isEnabled = false
        timer.invalidate()
        IsPlaying = false
    }
    
    func countTimer() -> Void {
        Counter += 0.1
        timeLabel.text = String(format:"%.2f",Counter)
        
    }


}
