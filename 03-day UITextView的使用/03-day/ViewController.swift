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
        limitLabel.text = "0"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
     
        
        initSubView()
    }
    
    func initClearButton() -> Void {
        let clearBtn = UIButton(frame: CGRect(x: self.limitTextView.frame.maxX - 80, y: self.limitTextView.frame.maxY, width: 80, height: 40))
        clearBtn.setTitle("Clear", for: .normal)
        clearBtn.setTitleColor(UIColor.black, for: .normal)
        clearBtn.addTarget(self, action: #selector(clearTextView), for: .touchUpInside)
        self.view.addSubview(clearBtn)
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
        
        initClearButton()
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

