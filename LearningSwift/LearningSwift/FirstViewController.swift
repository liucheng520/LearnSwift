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

    var dataSource : NSArray = ["timeLearning","fontLearning","localVedioLearning","imageBrowser","moveTest"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        return 44
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
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
}
