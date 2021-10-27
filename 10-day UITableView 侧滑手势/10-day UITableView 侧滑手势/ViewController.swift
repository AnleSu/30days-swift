//
//  ViewController.swift
//  10-day UITableView 侧滑手势
//
//  Created by Anlesu on 2021/10/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var table: UITableView!
    var alert: UIAlertController!
//    模拟数据源
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    private var dataSource: Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 66
        self.view.addSubview(table)
        self.dataSource = lyric.split(separator: ",").map(String.init)
        
        alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = self.dataSource[indexPath.row]
        cell?.textLabel?.textColor = .black
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal, title: "😀") { action, index in
            self.alert.message = "Thanks for your Love😸"
            self.showAlertController()
        }
        
        let unlikeAction = UITableViewRowAction(style: .normal, title: "😿") { action, index in
            self.alert.message = "Tell me why!!!😤"
            self.showAlertController()
        }
        
        let unknowAction = UITableViewRowAction(style: .normal, title: "✋") { action, index in
            self.alert.message = "What do you mean? 🤔"
            self.showAlertController()
        }
//        数组顺序 和展示顺序“相反”  第一个元素 显示在最右边
        return [likeAction, unlikeAction, unknowAction]
    }
    
    func showAlertController() {
        self.present(self.alert, animated: true) {
            let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false,block: { (timer) in
                self.alert.dismiss(animated: true, completion: nil)
            })
            RunLoop.main.add(dismissTimer, forMode: .common)
            
        }
    }

}

