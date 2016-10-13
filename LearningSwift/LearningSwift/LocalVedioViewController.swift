//
//  LocalVedioViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/12.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class LocalVedioViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView : UITableView!
    
    var dataSource : NSArray = [
        vedio(imageUrl:"videoScreenshot01", name:"Introduce 3DS Mario" ,time:"Youtube - 06:32"),
        vedio(imageUrl:"videoScreenshot02", name:"Emoji Among Us" ,time:"Vimeo - 3:34"),
        vedio(imageUrl:"videoScreenshot03", name:"Seals Documentary" ,time:"Vine - 00:06"),
        vedio(imageUrl:"videoScreenshot04", name:"Adventure Time" ,time:"Youtube - 02:39"),
        vedio(imageUrl:"videoScreenshot05", name:"Facebook HQ" ,time:"Facebook - 10:20"),
        vedio(imageUrl:"videoScreenshot06", name:"Lijiang Lugu Lake" ,time:"Allen - 20:30")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(LocalVedioCell.self, forCellReuseIdentifier: "vediocell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : LocalVedioCell = tableView.dequeueReusableCell(withIdentifier: "vediocell")! as! LocalVedioCell
        cell.setVedio(vedioM: dataSource[indexPath.row] as! vedio)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }

}
