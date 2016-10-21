//
//  AlertView.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/21.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

public enum ShowStatus {
    case fail
    case success
}

class AlertView: UIView {
    
    public func showStatus(inView : UIView){
        self.backgroundColor = UIColor.clear
        self.center = inView.center
        inView.addSubview(self)
        
        self.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        self.isHidden = true
        inView.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.5, animations: { 
            self.transform = CGAffineTransform.identity
            self.isHidden = false
            }) { (final) in
                self.dismiss()
                inView.isUserInteractionEnabled = true
        }
    }
    
    public func dismiss() -> Void {
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            self.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.isHidden = true
            }) { (final) in
                self.removeFromSuperview()
        }
    }
    
    init(frame: CGRect, status : ShowStatus) {
        super.init(frame: frame)
        let statusLabel = UILabel.init(frame: frame)
        statusLabel.font = UIFont.init(name: "Apple Color Emoji", size: 80.0)
        statusLabel.textAlignment = NSTextAlignment.center
        if status == ShowStatus.fail {
            statusLabel.text = "💔"
        }else{
            statusLabel.text = "😁"
        }
        self.addSubview(statusLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
