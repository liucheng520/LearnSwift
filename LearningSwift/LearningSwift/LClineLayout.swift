//
//  LClineLayout.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/14.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class LClineLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        //滚动方向
        scrollDirection = UICollectionViewScrollDirection.horizontal
    }
    
    //每次滑动停止，就会重新刷新布局，默认返回NO
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    //控制着每一个item的布局
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        //先从父类获取原始布局
        let attributesArr  = super.layoutAttributesForElements(in: rect)
        
        //屏幕中间点 collectionview的偏移 + collection宽度的一半
        let absCenterX : CGFloat = (collectionView?.contentOffset.x)! + (collectionView?.frame.size.width)! * 0.5

        for attr : UICollectionViewLayoutAttributes in attributesArr! {
            
            //当前item的中心点X
            let attrX : CGFloat = attr.center.x
  
            //当前item距离中心点的距离
            let delata : CGFloat = fabs(absCenterX - attrX)
            
            //计算缩放比例,应该是距离中心越近越大，所以用1（可调整），取反
            let scale : CGFloat  = 1 - delata / (collectionView?.frame.size.width)!

            //设置缩放的比例
            attr.transform = CGAffineTransform.init(scaleX: scale, y: scale)
        }
        
        return attributesArr;
    }
    
    //这个方法的返回值，就决定了collectionView停止滚动时的偏移量
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
     
        
        //获取滑动停止之后（包含惯性移动）界面里的item的布局
        //最后的偏移,（proposedContentOffset 最后的目标偏移）
        let rectX = proposedContentOffset.x
        
        let rect : CGRect = CGRect.init(x: rectX, y: 0, width: (collectionView?.frame.size.width)!, height: (collectionView?.frame.size.height)!)
        
        let attributeArr = super.layoutAttributesForElements(in: rect)
        
        //屏幕中间点 collectionview的偏移 + collection宽度的一半
        let absCenterX : CGFloat = rectX + (collectionView?.frame.size.width)! * 0.5
        
        //获取当前页面item距离中心线最近的，算出距离，做好偏移
        
        var delta : CGFloat = CGFloat.greatestFiniteMagnitude
        
        for attr : UICollectionViewLayoutAttributes in attributeArr! {
            
            //当前item的中心点X
            let attrX : CGFloat = attr.center.x
            
            //当前item距离中心点的距离
            let space : CGFloat = fabs(absCenterX - attrX)
            
            if space <= fabs(delta) {
                delta = attrX - absCenterX
            }
        }
        
        //修正最小的偏移，让其居中
        return CGPoint.init(x: proposedContentOffset.x + delta, y: proposedContentOffset.y)
    }
    
}
