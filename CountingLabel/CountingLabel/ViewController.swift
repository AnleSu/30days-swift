//
//  ViewController.swift
//  CountingLabel
//
//  Created by Anlesu on 2021/10/8.
//

import UIKit

class ViewController: UIViewController {
    let countingLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    var dispalyLink: CADisplayLink?
    var startValue = 0.0
    var endValue = 1200.0
    
//    数字快速跳动，应该是屏幕的刷新率 决定了跳动速度
//    @objc func handleUpdate() -> Void {
//        self.countingLabel.text = "\(startValue)"
//        startValue += 1
//        if startValue >= endValue {
//            startValue = endValue
//        }
//
//    }
    
    
    let animationDuration = 1.5
    let animationStartDate  = Date()
    @objc func handleUpdate() -> Void {
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        if elapsedTime > animationDuration {
            self.countingLabel.text = "\(endValue)"
            dispalyLink?.invalidate()
            dispalyLink = nil
        } else {
            let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            self.countingLabel.text = "\(value)"
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(countingLabel)
        countingLabel.frame = view.frame
        
        dispalyLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        dispalyLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }


}

