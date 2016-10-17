//
//  CenterViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/15.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit
import AVFoundation

//[IOS开发]拍照，摄像，载图总结
//http://www.cnblogs.com/liangzhimy/archive/2012/10/26/2740905.html
//http://www.jianshu.com/p/75ecae1413c2
//http://www.2cto.com/kf/201409/335951.html

/*
 
 1 建立Session
 
 2 添加 input
 
 3 添加output
 
 4 开始捕捉
 
 5 为用户显示当前录制状态
 
 6 捕捉
 
 7 结束捕捉
 
*/

class CenterViewController: UIViewController,AVCapturePhotoCaptureDelegate {

    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCapturePhotoOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    var tempImageView : UIImageView?
    var didTakePhoto : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        tempImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        view.addSubview(tempImageView!);
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = view.bounds
    }
    
    //启动录像
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession.init()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error : NSError?
        var input : AVCaptureDeviceInput?
        
        do {
             input = try AVCaptureDeviceInput.init(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if error == nil && captureSession?.canAddInput(input) != nil {
            captureSession?.addInput(input)
            stillImageOutput = AVCapturePhotoOutput.init()
            
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                captureSession?.canAddOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                view.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }

    func didPressTakeAnother() -> Void {
        if didTakePhoto == true {
            tempImageView?.isHidden = true
            didTakePhoto = false
        }else{
            captureSession?.startRunning()
            didTakePhoto = true
            didpressTakePhoto()
        }
    }
    
    func didpressTakePhoto() -> Void {
        let videoConnection : AVCaptureConnection = (stillImageOutput?.connection(withMediaType: AVMediaTypeVideo))!
        
        videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
        stillImageOutput?.capturePhoto(with: AVCapturePhotoSettings.init(), delegate: self)
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if photoSampleBuffer != nil {
            let imageData = AVCapturePhotoOutput.dngPhotoDataRepresentation(forRawSampleBuffer: photoSampleBuffer!, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            let dataProvider = CGDataProvider.init(data: imageData as! CFData)
            let cgImageRef = CGImage.init(pngDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage.init(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
            
            tempImageView?.image = image
            tempImageView?.isHidden = false
        }
    }
}
