//
//  RefreshListVC.swift
//  swiftProject
//
//  Created by AlbertHuang on 2018/2/5.
//  Copyright © 2018年 Karo. All rights reserved.
//

import UIKit

class RefreshListVC: UIViewController {
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let cellId = "refreshCellId"
    let addEmoji  = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    lazy var tableView = UITableView.init()
    lazy var refreshControl = UIRefreshControl.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RefreshList"
        emojiData = favoriteEmoji;
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tableView.frame = self.view.bounds
    }
    
    func setupUI() {
        self.view.addSubview(self.tableView)
        setupTableViewUI()
    }
    
    func setupTableViewUI() {
        
        tableView.delegate = (self as UITableViewDelegate)
        tableView.dataSource = (self as UITableViewDataSource)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = self.refreshControl
        } else {
            // Fallback on earlier versions
        }
        
        refreshControl.addTarget(self, action: #selector(RefreshListVC.didRoadEmoji), for: .valueChanged)
        refreshControl.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.white
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60.0
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorStyle = .none
    }

}
extension RefreshListVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = self.emojiData[indexPath.row];
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc func didRoadEmoji() {
        emojiData = addEmoji
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
}
