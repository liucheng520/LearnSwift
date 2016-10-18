//
//  PullRefreshViewController.swift
//  LearningSwift
//
//  Created by 刘成 on 2016/10/18.
//  Copyright © 2016年 fff. All rights reserved.
//

import UIKit

//添加上拉加载

class PullRefreshViewController: UIViewController {

    var tableView : UITableView!
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    
    var dataSource : NSMutableArray = NSMutableArray.init()
    
    var refreshControl : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.black
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        refreshControl = UIRefreshControl.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 80))
        refreshControl.backgroundColor = UIColor.red
        refreshControl.tintColor = UIColor.white
        let attributes : NSAttributedString = NSAttributedString.init(string: String(describing: NSDate.init()))
        refreshControl.attributedTitle = attributes
        refreshControl.addTarget(self, action: #selector(self.loadData), for: UIControlEvents.valueChanged)

        tableView.refreshControl = refreshControl
    }
    
     func loadData() -> Void {
        dataSource.addObjects(from: favoriteEmoji)
        refreshControl.endRefreshing()
        tableView.reloadData()
    }

}

//用扩展来模块化
extension PullRefreshViewController : UITableViewDelegate,UITableViewDataSource{
    
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
}
