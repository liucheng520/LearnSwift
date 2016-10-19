//
//  ImagePreScrollView.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/19.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class ImagePreScrollView: UIScrollView {

    private var _imgUrl : String = String.init()
    public var imgUrl : String {
        get {
            return _imgUrl
        }
        
        set(url){
            _imgUrl = url
            imageView.image = UIImage.init(named: imgUrl)
            adjustFrame()
        }
    }
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //相关属性设置
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
        
        //添加imageView
        imageView = UIImageView.init()
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.isUserInteractionEnabled = true
        addSubview(imageView)
        
        //添加点击事件
        addTapGesture()
    }
    
    func addTapGesture() -> Void {
        let doubleTapGesture : UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.doubleTapped(recognizer:)))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(doubleTapGesture)
    }
    
    func doubleTapped(recognizer:UITapGestureRecognizer) -> Void {
        
        let touchPoint : CGPoint = recognizer.location(in: self)
        
        //如果图片本身已经处于放大状态，则变为原始大小，否则缩放到最大比例
       if self.minimumZoomScale < 1.0 { //最小比例小于1，表示原始图片很小
            if self.zoomScale == 1.0 {
                self.zoom(to: CGRect.init(x: touchPoint.x, y: touchPoint.y, width: 1, height: 1), animated: true)
            }else{
                self.setZoomScale(1.0, animated: true)
            }
       }else{
            if self.zoomScale <= 1.0 {
                self.zoom(to: CGRect.init(x: touchPoint.x, y: touchPoint.y, width: 1, height: 1), animated: true)
            }else{
                self.setZoomScale(1.0, animated: true)
            }
        }
    }
    
    //根据图片的原始大小计算初始位置
    func adjustFrame() -> Void {
        
        if imageView.image == nil {return}
        
        let scrollWidth = self.bounds.width   //scrollview的宽
        let scrollHeight = self.bounds.height //scrollview的高
        let imageOrginalWidth = imageView.image?.size.width  //图片的原始宽
        let imageOrginalHeight = imageView.image?.size.height //图片的原始高
        
        //计算图片的缩放，应该以scrollview的宽度为基础，来进行缩放
        let scale : CGFloat = scrollWidth / imageOrginalWidth!
        let imageHeightFinal : CGFloat = imageOrginalHeight! * scale
        
        //确保图片展示
        let imageFrame : CGRect = CGRect.init(x: 0, y: max(0, (scrollHeight - imageHeightFinal) * 0.5), width: scrollWidth, height: imageHeightFinal)
        imageView.frame = imageFrame
        
        //设置最大，最小缩放比例 
        //最大缩放，微信2.0，微博2.5
        self.maximumZoomScale = 2.5
        
        //最小缩放比例，大于1.0为1.0
        if scale <= 1.0 {//图片宽度大于屏幕宽
            self.minimumZoomScale = 1.0;
        }else{//图片宽度小于屏幕宽
            self.minimumZoomScale = imageOrginalWidth! / scrollWidth
        }
        
        self.contentSize = CGSize.init(width: imageFrame.size.width, height: imageFrame.size.height)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var scrollViewOldRect : CGRect = CGRect.init()
    
}

extension ImagePreScrollView : UIScrollViewDelegate{
    
    //返回需要缩放的view
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    //缩放过程中都会调用的方法，矫正frame，确保图片一直位于中心
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        imageView.center = adjustTheSaleViewCenter(scrollView: scrollView)
    }
    
    func adjustTheSaleViewCenter(scrollView:UIScrollView) -> CGPoint {
        let offsetX : CGFloat = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0
        let offsetY : CGFloat = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0
        
        return CGPoint.init(x: scrollView.contentSize.width * 0.5 + offsetX, y: scrollView.contentSize.height * 0.5 + offsetY)
    }
}
