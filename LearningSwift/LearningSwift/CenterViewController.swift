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
    var frontInput : AVCaptureDeviceInput?
    var backInput : AVCaptureDeviceInput?
    var isFront : Bool!
    var errorFront : NSError?
    var errorBack : NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
        tempImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        view.addSubview(tempImageView!);
        
        isFront = true
        
        let button : UIButton = UIButton.init(type: UIButtonType.custom)
        button.setTitle("change", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.frame = CGRect.init(x: kScreenWidth - 60, y: 0, width: 50, height: 50)
        view .addSubview(button)
        button.addTarget(self, action: #selector(self.changeCamer), for: UIControlEvents.touchUpInside)
        
        //配置前置摄像头
        let frontCamera = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: AVCaptureDevicePosition.front)

        do {
            frontInput = try AVCaptureDeviceInput.init(device: frontCamera)
        } catch let error1 as NSError {
            errorFront = error1
            frontInput = nil
        }
        
        //配置后置摄像头
        let backCamera = AVCaptureDevice.defaultDevice(withDeviceType: AVCaptureDeviceType.builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: AVCaptureDevicePosition.back)
        
        do {
            backInput = try AVCaptureDeviceInput.init(device: backCamera)
        } catch let error2 as NSError {
            errorBack = error2
            backInput = nil
        }
        
    }

    //前后摄像头切换
    func changeCamer() -> Bool {
        
        if isFront == true {
            isFront = false
            if captureSession?.inputs.count == 0 {
                if errorFront == nil && captureSession?.canAddInput(frontInput) != nil {
                    captureSession?.addInput(frontInput)
                    return true
                }else{
                    return false
                }
            }else{
                captureSession?.removeInput(backInput)
                if errorFront == nil && captureSession?.canAddInput(frontInput) != nil {
                    captureSession?.addInput(frontInput)
                    return true
                }else{
                    return false
                }
            }

        }else{
            isFront = true
            captureSession?.removeInput(frontInput)
            if errorBack == nil && captureSession?.canAddInput(backInput) != nil {
                captureSession?.addInput(backInput)
                return true
            }else{
                return false
            }
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer?.frame = view.bounds
    }
    
    //启动录像
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //1 建立Session
        captureSession = AVCaptureSession.init()
        
        //设置采集的质量
        captureSession?.sessionPreset = AVCaptureSessionPreset640x480
        
        //2 添加 input
        let isadd = changeCamer()
        
        if isadd == true {
            
            //3 添加output
            stillImageOutput = AVCapturePhotoOutput.init()
            stillImageOutput?.photoSettingsForSceneMonitoring = AVCapturePhotoSettings.init(format: [AVVideoCodecKey : AVVideoCodecJPEG])
      
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                captureSession?.addOutput(stillImageOutput)
                
                //添加页面显示
                previewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                view.layer.addSublayer(previewLayer!)
                
                //4 开始捕捉
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
        
        //静态图片采集
        stillImageOutput?.capturePhoto(with: AVCapturePhotoSettings.init(), delegate: self)
    }
    
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if photoSampleBuffer != nil {
            let imageData = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: photoSampleBuffer!, previewPhotoSampleBuffer: previewPhotoSampleBuffer)
            
            let dataProvider = CGDataProvider.init(data: imageData as! CFData)
            let cgImageRef = CGImage.init(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
            
            let image = UIImage.init(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
            
            tempImageView?.image = image
            tempImageView?.isHidden = false
        }
    }
}
