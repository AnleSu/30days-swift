//
//  ViewController.swift
//  04 - day
//
//  Created by Anlesu on 2020/12/14.
//

import UIKit
/**
 *Class 'ViewController' has no initializers
 *Swift中要求变量或常量在声明时就要初始化其值
 *解决办法：
 1、在声明时对其进行初始化
 * 2、在实际开发中，声明变量或常量时使用可选类型。
 */
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray = Array<String>()
    /**
     *声明变量或常量时使用可选类型。
     */
    var refreshControl : UIRefreshControl!
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initDataArray()
        initSubviews()
        tableView.reloadData()
    }
    
    func initSubviews() -> Void {
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        
        tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view .addSubview(tableView)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refreshControlAction() {
        initDataArray()
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
    
    func initDataArray() -> Void {
        dataArray.append("cell的内容")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellIndentifer")
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
        
    }


}

