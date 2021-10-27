//
//  ViewController.swift
//  02-day
//
//  Created by Anlesu on 2020/12/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var text = """
     希望可以一直坚持学习
     哪怕做不到真的每天都更新 也要坚持
     想一起学习的 可以留言
     swift的多行字符串 看看效果
     """
     
     var fonts:Array = [
         "MFTongXin_Noncommercial-Regular",
                          "MFJinHei_Noncommercial-Regular",
                          "MFZhiHei_Noncommercial-Regular",
                          "Zapfino",
                          "Gaspar Regular"]
    
    var fontIndex = 0
    let textLabel = UILabel()
    let changeBtn = UIButton()
    
    @objc func changeFont() {
        fontIndex = (fontIndex + 1) % 5
        textLabel.font = UIFont.init(name: self.fonts[fontIndex], size: 17)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.textLabel.font = UIFont.systemFont(ofSize: 17)
        self.textLabel.textColor = UIColor.black
        self.textLabel.numberOfLines = 0
        self.textLabel.text = text
        self.view.addSubview(self.textLabel)
        
        self.textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.centerX.equalTo(self.view)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        self.changeBtn.setTitle("修改字体", for: .normal)
        self.changeBtn.addTarget(self, action: #selector(changeFont), for: .touchUpInside)
        self.changeBtn.backgroundColor = UIColor.blue
        self.view.addSubview(self.changeBtn)
        self.changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.textLabel.snp.bottom).offset(50)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(80)
        }
        
        
    }


}

