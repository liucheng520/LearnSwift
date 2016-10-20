//
//  EmojMachine.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/20.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class EmojMachine: UIViewController {
    
    var imageArray = [String]()
    var dataSource1 = [Int]()
    var dataSource2 = [Int]()
    var dataSource3 = [Int]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let backGroundImageView : UIImageView = UIImageView.init(image: UIImage.init(named: "Hyperspace - iPhone"))
        backGroundImageView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        view.addSubview(backGroundImageView)
        
        let picker : UIPickerView = UIPickerView.init(frame: CGRect.init(x: 10, y: 100, width: kScreenWidth - 20, height: 200))
        picker.delegate = self
        picker.dataSource = self
        view.addSubview(picker)
        
        let loginBtn : UIButton = UIButton.init(type: UIButtonType.custom)
        loginBtn.setTitle("Login", for: UIControlState.normal)
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginBtn.backgroundColor = UIColor.red
        loginBtn.layer.cornerRadius = 3.0
        loginBtn.layer.masksToBounds = true
        loginBtn.frame = CGRect.init(x: 60, y: kScreenHeight - 170, width: kScreenWidth - 120, height: 50)
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(self.loginBtnAnimation), for: UIControlEvents.touchUpInside)
        
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for _ in 0...100 {
            let randomInt = arc4random() % 10
            dataSource1.append(Int(randomInt))
            dataSource2.append(Int(randomInt))
            dataSource3.append(Int(randomInt))
        }
    }
    
    func loginBtnAnimation() -> Void {
        
    }
}

extension EmojMachine : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label : UILabel = UILabel.init()
        label.font = UIFont.init(name: "Apple Color Emoji", size: 18.0)
        label.textAlignment = NSTextAlignment.center
        return label
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return (kScreenWidth - 20) / 3
    }
}
