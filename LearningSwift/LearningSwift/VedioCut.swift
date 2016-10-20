//
//  VedioCut.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/19.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit
import AVFoundation

extension String{
    var convert : NSString {return (self as NSString)}
}

//视频裁剪,线程的使用方式改变

class VedioCut: NSObject {

    public func cutVideo(videoURL url:URL ,startTime : CGFloat ,duration : CGFloat ,completion : @escaping ((_ videoPath : URL,_ error : NSError) -> Void)){
        
        //创建队列
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        
        //异步线程
        queue.async {
            
            //该类是AVAsset的子类,AVAsset类专门用于获取多媒体的相关信息,包括获取多媒体的画面、声音等信息。而AVURLAsset子类的作用则是根据NSURL来初始化AVAsset对象。
            let asset : AVAsset = AVURLAsset.init(url: url)
            
            //视频剪辑类
            let exportSession = AVAssetExportSession.init(asset: asset, presetName: AVAssetExportPresetHighestQuality)
            
            //生成到处path
            //获取document路径
            let paths : NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
            
            var outPutURL = paths.object(at: 0) as! String
            
            let manager = FileManager.default
            
            do {
                try manager.createDirectory(atPath: outPutURL, withIntermediateDirectories: true, attributes: nil)
            }catch _ {
                
            }
            
            //拼接导出全路径
            outPutURL = outPutURL.convert.appendingPathComponent("output.mp4")
            
            do {
                try manager.removeItem(atPath: outPutURL)
            }catch _ {
                
            }
            
            if let exportSession = exportSession as AVAssetExportSession? {
                
                //设置剪切视频样式
                //导出路径
                exportSession.outputURL = NSURL.init(fileURLWithPath: outPutURL) as URL
                exportSession.shouldOptimizeForNetworkUse = true
                
                //格式
                exportSession.outputFileType = AVFileTypeMPEG4
                
                //剪切时间段
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                
                //异步剪辑
                exportSession.exportAsynchronously(completionHandler: {
                    
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed : completion(exportSession.outputURL!,NSError.init())
                    case AVAssetExportSessionStatus.failed : print("failed")
                    case AVAssetExportSessionStatus.cancelled : print("cancle")
                    default: print("defalut")
                    }
                })
            }
        }

    }
}
