//
//  BackGroundVideoController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/19.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

public enum ScaleMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

class BackGroundVideoController: UIViewController {

    //video的frame
    public var vedioFrame : CGRect = CGRect.init()
    //开始时间
    public var startTime : CGFloat = 0.0
    //时长
    public var duration : CGFloat = 0.0
    //声音
    public var sound : Bool = true {
        didSet{
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    //透明度
    public var alpha : CGFloat = 1.0{
        didSet{
            moviePlayer.view.alpha = alpha
        }
    }
    
    //背景色
    public var backGroundColor : UIColor = UIColor.black {
        didSet{
            view.backgroundColor = backGroundColor
        }
    }
    
    //是否重复播放，如果重复播放，则监听player的结束，并重新开始
    public var alwaysRepeat : Bool = true{
        didSet{
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(self.playerAgainAndAgain), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
            }
        }
    }
    
    //设置视频的播放样式
    public var scaleMode : ScaleMode = ScaleMode.resizeAspectFill {
        didSet{
            switch scaleMode {
            case ScaleMode.resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case ScaleMode.resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case ScaleMode.resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    //播放路径
    public var contentURL : URL!{
        didSet{
            
            setMoviePlayer(playerUrl: contentURL)
        }
    }
    
    //1.0 播放器
    private let moviePlayer : AVPlayerViewController = AVPlayerViewController.init()
    
    //声音
    private var moviePlayerSoundLevel : Float = 1.0
    
    //开始播放
    func setMoviePlayer(playerUrl : URL) -> Void {
        
        VedioCut.init().cutVideo(videoURL: playerUrl, startTime: startTime, duration: duration) { (showURL, error) in
            
            if let path = showURL as URL?{
                self.moviePlayer.player = AVPlayer.init(url: path)
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                self.moviePlayer.player?.play()
            }
        }
    }
    
    //重复播放，把播放时间置为0.并开始播放
    func playerAgainAndAgain() -> Void {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    //添加视频播放器到view.并将view至于最底层
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviePlayer.view.frame = view.frame
        moviePlayer.showsPlaybackControls = false //不显示进度条之类的
        moviePlayer.view.isUserInteractionEnabled = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }

    // 移除观察者
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}
