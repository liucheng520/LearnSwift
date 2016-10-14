//
//  LineCollectionViewCell.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/14.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class LineCollectionViewCell: UICollectionViewCell {
    
    var imageV : UIImageView!
    public var label : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        imageV = UIImageView.init()
        imageV.backgroundColor = UIColor.red
        contentView.addSubview(imageV)
        
        label = UILabel.init()
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        contentView.addSubview(label)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        imageV.frame = CGRect.init(x:5, y: 5, width: contentView.frame.size.width - 10, height: contentView.frame.size.height - 10)
        label.frame = CGRect.init(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
