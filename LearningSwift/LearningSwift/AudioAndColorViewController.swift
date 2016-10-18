//
//  AudioAndColorViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/18.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit
import AVFoundation

class AudioAndColorViewController: UIViewController,AVAudioPlayerDelegate {

    var player : AVAudioPlayer = AVAudioPlayer.init() //音频播放器
    
    let gradientLayer : CAGradientLayer = CAGradientLayer.init() //渐变layer
    
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let playBtn : UIButton = UIButton.init(type: UIButtonType.custom)
        playBtn.setImage(UIImage.init(named: "playBtn"), for: UIControlState.normal)
        playBtn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        playBtn.center = view.center
        playBtn.addTarget(self, action: #selector(self.palyBtnClick), for: UIControlEvents.touchUpInside)
        view.addSubview(playBtn)
    }
    
    func palyBtnClick() -> Void {
        
        //获取文件路径
        let audioPath = Bundle.main.path(forResource: "Ecstasy", ofType: "mp3")
        let audioFileUrl = URL.init(fileURLWithPath: audioPath!)
        
        do {
            //设置player
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try player = AVAudioPlayer.init(contentsOf: audioFileUrl)
            
            //播放
            player.prepareToPlay()
            player.play()
            player.delegate = self
            
        } catch let audioError as NSError {
            print(audioError)
        }
        
        //设置随机背景色
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        view.backgroundColor = UIColor.init(red: redValue / 255.0, green: blueValue / 255.0, blue: greenValue / 255.0, alpha: 1.0)
        
        //设置渐变layer
        gradientLayer.frame = view.bounds
        
        let color1 = UIColor.init(white: 0.5, alpha: 0.2).cgColor
        let color2 = UIColor.init(red: 1.0, green: 0, blue: 0, alpha: 0.4).cgColor
        let color3 = UIColor.init(red: 0, green: 1.0, blue: 0, alpha: 0.3).cgColor
        let color4 = UIColor.init(red: 0, green: 0, blue: 1.0, alpha: 0.3).cgColor
        let color5 = UIColor.init(white: 0.4, alpha: 0.2).cgColor
        
        gradientLayer.colors = [color1,color2,color3,color4,color5]
        gradientLayer.locations = [0.1,0.3,0.5,0.7,0.9]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        view.layer.addSublayer(gradientLayer)
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.changeColor), userInfo: nil, repeats: true)
    }
    
    func changeColor() -> Void {
        //设置随机背景色
        let redValue = CGFloat(drand48())
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        view.backgroundColor = UIColor.init(red: redValue, green: blueValue, blue: greenValue, alpha: 1.0)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        timer.invalidate()
    }
}
