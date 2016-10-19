//
//  LoginViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/19.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class LoginViewController: BackGroundVideoController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let login : UIButton = UIButton.init(type: UIButtonType.custom)
        login.setTitle("Login in", for: UIControlState.normal)
        login.setTitleColor(UIColor.white, for: UIControlState.normal)
        login.backgroundColor = UIColor.green
        login.frame = CGRect.init(x: 50, y: kScreenHeight - 200, width: kScreenWidth - 100, height: 40)
        login.addTarget(self, action: #selector(self.login), for: UIControlEvents.touchUpInside)
        view.addSubview(login)
        
        let register : UIButton = UIButton.init(type: UIButtonType.custom)
        register.setTitle("Register", for: UIControlState.normal)
        register.setTitleColor(UIColor.white, for: UIControlState.normal)
        register.backgroundColor = UIColor.red
        register.frame = CGRect.init(x: 50, y: kScreenHeight - 140, width: kScreenWidth - 100, height: 40)
        view.addSubview(register)
        
        let url = NSURL.init(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        vedioFrame = view.frame
        scaleMode = ScaleMode.resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url as URL!
    }
    
    func login() -> Void {
        self.navigationController?.pushViewController(ImagePreViewController.init(), animated: true)
    }
}
