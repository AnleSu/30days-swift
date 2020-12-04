//
//  ViewController.swift
//  03-day
//
//  Created by Anlesu on 2020/12/4.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var limitTextView: UITextView!
    var submmitBtn: UIButton!
    var limitLabel: UILabel!
    var limitCount = 50
    @objc func clearTextView() {
        limitTextView.text = ""
        limitLabel.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusBarFrame = UIApplication.shared.statusBarFrame
        initNavigator()
        initSubView()
    }
    
    func initNavigator() -> Void {
//        let rightItem = UIBarButtonItem(title: "clear", style: .plain, target: self, action: #selector(clearTextView))
//
//        self.navigationItem.rightBarButtonItem = rightItem
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: nil)
        rightItem.tintColor = UIColor.green
        navigationItem.rightBarButtonItem = rightItem
    }
    
    func initSubView() ->  Void {
        limitTextView = UITextView(frame: CGRect(x: 80, y: 80, width: self.view.frame.width-160, height: 300))
        limitTextView.delegate = self
        limitTextView.font = UIFont.systemFont(ofSize: 20)
        limitTextView.backgroundColor = UIColor.yellow
        self.view.addSubview(limitTextView)
        
        limitLabel = UILabel(frame: CGRect(x: self.limitTextView.frame.minX, y: self.limitTextView.frame.maxY, width: 60, height: 40))
        limitLabel.font = UIFont.systemFont(ofSize: 12)
        limitLabel.text = "50"
        self.view.addSubview(limitLabel)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let currentCount = textView.text.count

        if textView.text.count > 50 {
            if let str = textView.text {
                textView.resignFirstResponder()
                let substr = str.prefix(50)
                textView.text = String(substr)
            }
            
        } else {
            limitLabel.text = "\(50 - currentCount)"
        }
        
    }


}

