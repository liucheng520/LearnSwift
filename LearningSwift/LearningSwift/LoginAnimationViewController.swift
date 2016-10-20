//
//  LoginAnimationViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/20.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class LoginAnimationViewController: UIViewController {

    var userNameTextField : UITextField!
    var passWordTextField : UITextField!
    var loginBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        createSubViews()
    }

    //创建视图
    func createSubViews() -> Void {
        
        userNameTextField = UITextField.init()
        userNameTextField.backgroundColor = UIColor.white
        userNameTextField.layer.cornerRadius = 4.0
        userNameTextField.layer.masksToBounds = true
        userNameTextField.frame = CGRect.init(x: 20, y: 90, width: kScreenWidth - 40, height: 40)
        userNameTextField.placeholder = "  username"
        view.addSubview(userNameTextField)
        
        passWordTextField = UITextField.init()
        passWordTextField.backgroundColor = UIColor.white
        passWordTextField.layer.cornerRadius = 4.0
        passWordTextField.layer.masksToBounds = true
        passWordTextField.frame = CGRect.init(x: 20, y: 150, width: kScreenWidth - 40, height: 40)
        passWordTextField.placeholder = "  password"
        view.addSubview(passWordTextField)
        
        loginBtn = UIButton.init(type: UIButtonType.custom)
        loginBtn.setTitle("Login", for: UIControlState.normal)
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginBtn.backgroundColor = UIColor.red
        loginBtn.layer.cornerRadius = 3.0
        loginBtn.layer.masksToBounds = true
        loginBtn.frame = CGRect.init(x: 100, y: 210, width: kScreenWidth - 200, height: 40)
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(self.loginBtnAnimation), for: UIControlEvents.touchUpInside)
    }
    
    //登录按钮动画
    func loginBtnAnimation() -> Void {

    }
    
    //显示核心动画
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        userNameTextField.frame.origin.x = 20 - kScreenWidth
        userNameTextField.isHidden = true
        
        passWordTextField.frame.origin.x = 20 - kScreenWidth
        passWordTextField.isHidden = true
        
        loginBtn.frame.origin.x = 100 - kScreenWidth
        loginBtn.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            
            self.userNameTextField.frame.origin.x = 20
            self.userNameTextField.isHidden = false
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            self.passWordTextField.frame.origin.x = 20
            self.passWordTextField.isHidden = false
            
        }) { (anima) in }
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            self.loginBtn.frame.origin.x = 100
            self.loginBtn.isHidden = false
            
        }) { (anima) in
            
            let bounds = self.loginBtn.bounds
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
                
                self.loginBtn.bounds = CGRect.init(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
                
            }) { (final) in}
        }
    }

}
