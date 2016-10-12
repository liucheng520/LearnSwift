//
//  UINavigationBar+axesome.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/12.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

var overlayKey:CChar!

extension UINavigationBar{
    
    func SYSTEM_VERSION_LESS_THAN(v:String) -> Bool {
        return UIDevice.current.systemVersion.compare(v) == ComparisonResult.orderedAscending
    }

    public func lc_setBackGroundColor(color:UIColor) -> Void {
        
        setBackgroundImage(UIImage.init(), for: UIBarMetrics.default)
        
    }
    
    public func lc_reset() -> Void{
        
    }
    
    private func lc_setElementsAlpha(alpha:CGFloat) -> Void{
        
    }
    
    private func lc_setTranslationY(translationY:CGFloat) -> Void{
        
    }
}
