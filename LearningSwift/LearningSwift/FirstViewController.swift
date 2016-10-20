//
//  FirstViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/11.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView : UITableView!

    var dataSource : NSArray = ["timeLearning","fontLearning","localVedioLearning","imageBrowser","moveTest","LocationViewController","PullRefresh","AudioAndColor","ImagePreView","BackGroundVideo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let viewCtrol = TimeLearnViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 1 {
            let viewCtrol = FontLearnViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 2 {
            let viewCtrol = LocalVedioViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 3 {
            let viewCtrol = ImageBrowserViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 4 {
            let viewCtrol = MoveTestViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 5 {
            let viewCtrol = LocationViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 6 {
            let viewCtrol = PullRefreshViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 7 {
            let viewCtrol = AudioAndColorViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 8 {
            let viewCtrol = ImagePreViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }else if indexPath.row == 9 {
            let viewCtrol = LoginViewController.init()
            viewCtrol.title = dataSource[indexPath.row] as? String
            navigationController?.pushViewController(viewCtrol, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    //将tableview上所有可见的cell往下偏移一个屏幕，然后在依次恢复
    func animateTable() {
        
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            
            let cell: UITableViewCell = a as UITableViewCell
            
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                
                }, completion: nil)
            
            index += 1
        }
    }
}
