//
//  ImageBrowserViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/14.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class ImageBrowserViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var collectionView : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        createSubViews()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    func createSubViews() -> Void {
        
        //创建布局layout
        let layout : LClineLayout = LClineLayout.init()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        
        //创建collectionview
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 200, width: kScreenWidth, height: 200), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.black
        collectionView.register(LineCollectionViewCell.self, forCellWithReuseIdentifier: "lineCollection")
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : LineCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "lineCollection", for: indexPath) as! LineCollectionViewCell
        cell.label.text = String(indexPath.item)
        return cell
    }
}
