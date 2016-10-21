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
    var picker : UIPickerView!
    var alert : AlertView!
    var loginBtn : UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let backGroundImageView : UIImageView = UIImageView.init(image: UIImage.init(named: "Hyperspace - iPhone"))
        backGroundImageView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        view.addSubview(backGroundImageView)
        
        picker = UIPickerView.init(frame: CGRect.init(x: 10, y: 100, width: kScreenWidth - 20, height: 200))
        picker.delegate = self
        picker.dataSource = self
        view.addSubview(picker)
        
        loginBtn = UIButton.init(type: UIButtonType.custom)
        loginBtn.setTitle("Login", for: UIControlState.normal)
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginBtn.backgroundColor = UIColor.red
        loginBtn.layer.cornerRadius = 3.0
        loginBtn.layer.masksToBounds = true
        loginBtn.frame = CGRect.init(x: 60, y: kScreenHeight - 170, width: kScreenWidth - 120, height: 50)
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(self.loginBtnAnimation), for: UIControlEvents.touchUpInside)
        
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
    
        for _ in 0...10 {
            let randomInt = arc4random() % 10
            dataSource1.append(Int(randomInt))
            dataSource2.append(Int(randomInt))
            dataSource3.append(Int(randomInt))
        }
        
        alert = AlertView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100), status: ShowStatus.fail)
    }
    
    func loginBtnAnimation() -> Void {
        
        picker.selectRow(Int(arc4random() % 10 ), inComponent: 0, animated: true)
        picker.selectRow(Int(arc4random() % 10 ), inComponent: 1, animated: true)
        picker.selectRow(Int(arc4random() % 10 ), inComponent: 2, animated: true)
        
        if (dataSource1[picker.selectedRow(inComponent: 0)] == dataSource2[picker.selectedRow(inComponent: 1)])&&(dataSource1[picker.selectedRow(inComponent: 1)] == dataSource2[picker.selectedRow(inComponent: 2)]){
            
            loginBtn.setTitle("Bing GO ", for: UIControlState.normal)
            let bounds = loginBtn.bounds
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.loginBtn.bounds = CGRect.init(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                
            }) { (final) in
                UIApplication.shared.keyWindow?.rootViewController = MainViewController.init()
            }
            
        }else{
            alert.showStatus(inView: view)
        }
    }

}

extension EmojMachine : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label : UILabel = UILabel.init()
        label.font = UIFont.init(name: "Apple Color Emoji", size: 80.0)
        label.textAlignment = NSTextAlignment.center

        if component == 0 {
            label.text = imageArray[dataSource1[row]]
        }else if component == 1 {
            label.text = imageArray[dataSource2[row]]
        }else if component == 2 {
            label.text = imageArray[dataSource3[row]]
        }
        
        return label
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return (kScreenWidth - 20) / 3
    }
}
