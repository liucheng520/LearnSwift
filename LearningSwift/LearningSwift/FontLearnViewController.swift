//
//  FontLearnViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/12.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class FontLearnViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView : UITableView!
    
    var dataSource : NSArray = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博",
                "测试测试测试测试测试测试",
                "123",
                "Alex",
                "@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "edundot", "Gaspar Regular"]
    
    var fontIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 200), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let changeBtn = UIButton.init(type: UIButtonType.custom)
        changeBtn.setTitle("Change Font", for: UIControlState.normal)
        changeBtn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        changeBtn.center = CGPoint.init(x: kScreenWidth * 0.5, y: kScreenHeight - 125);
        changeBtn.backgroundColor = UIColor.yellow
        changeBtn.layer.cornerRadius = 50.0
        changeBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        changeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        view.addSubview(changeBtn)
        changeBtn.addTarget(self, action: #selector(self.changeFont), for: UIControlEvents.touchUpInside)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        cell.textLabel?.font = UIFont.init(name: fontNames[fontIndex], size: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }

    func changeFont() -> Void {
        
        fontIndex += 1
        if fontIndex == 5 {
            fontIndex = 0
        }
        
        tableView.reloadData()
    }

}
