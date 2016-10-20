//
//  LocalVedioCell.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/12.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

struct vedio {
    
    let imageUrl : String
    let name : String
    let time : String
}

public protocol LocalVedioCellDelegate : NSObjectProtocol {
    
     func playBtnClick(btnClick:Bool)
}

class LocalVedioCell: UITableViewCell {

    var playBtn : UIButton!
    var backImageView : UIImageView!
    var nameLabel : UILabel!
    var timeLable : UILabel!
    var delegate : LocalVedioCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews() -> Void {
        
        //背景图片
        backImageView = UIImageView.init()
        backImageView.isUserInteractionEnabled = true
        contentView.addSubview(backImageView)
        
        //播放按钮
        playBtn = UIButton.init(type: UIButtonType.custom)
        playBtn.setImage(UIImage.init(named: "playBtn"), for: UIControlState.normal)
        playBtn .addTarget(self, action: #selector(self.playBtnClick), for: UIControlEvents.touchUpInside)
        contentView.addSubview(playBtn)
        
        //视频名称
        nameLabel = UILabel.init()
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        nameLabel.textAlignment = NSTextAlignment.center
        contentView.addSubview(nameLabel)
        
        //播放时长
        timeLable = UILabel.init()
        timeLable.textColor = UIColor.white
        timeLable.font = UIFont.systemFont(ofSize: 13.0)
        timeLable.textAlignment = NSTextAlignment.center
        contentView.addSubview(timeLable)
    }

    public func setVedio(vedioM:vedio) -> Void {
        
        backImageView.image = UIImage.init(named: vedioM.imageUrl)
        nameLabel.text = vedioM.name
        timeLable.text = vedioM.time
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        playBtn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        
        playBtn.center = CGPoint.init(x: frame.size.width * 0.5, y: frame.size.height * 0.5)
        
        backImageView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: frame.height)
        
        nameLabel.frame = CGRect.init(x: 0, y: frame.height * 0.5 + 30, width: kScreenWidth, height: 30)
        
        timeLable.frame = CGRect.init(x: 0, y: frame.height * 0.5 + 70, width: kScreenWidth, height: 20)
    }
    
    func playBtnClick() -> Void {
        
        delegate.playBtnClick(btnClick: true)
        
    }
}
