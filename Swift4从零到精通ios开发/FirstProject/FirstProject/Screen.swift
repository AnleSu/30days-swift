//
//  Screen.swift
//  FirstProject
//
//  Created by 宿安乐 on 2022/6/17.
//

import UIKit

class Screen: UIView {
    var inputLabel:UILabel?
    var historyLabel:UILabel?
    var inputString = ""
    var historyString = ""
    let fingureArray:Array<Character> = ["0",".",
                                         "1","2","3",
                                         "4","5","6",
                                         "7","8","9"]
    let funcArray = ["%"
                     ,"+"
                     ,"-"
                     ,"*"
                     ,"^","/"]
    
    init() {
        inputLabel = UILabel()
        historyLabel = UILabel()
        super.init(frame: CGRect.zero)
        installUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installUI() {
        inputLabel?.textAlignment = .right
        historyLabel?.textAlignment = .right
        
        inputLabel?.font = UIFont.systemFont(ofSize: 34)
        historyLabel?.font = UIFont.systemFont(ofSize: 30)
        
        inputLabel?.textColor = UIColor.orange
        historyLabel?.textColor = UIColor.black
        
        inputLabel?.adjustsFontSizeToFitWidth = true
        inputLabel?.minimumScaleFactor = 0.5
        
        historyLabel?.adjustsFontSizeToFitWidth = true
        historyLabel?.minimumScaleFactor = 0.5
        
        inputLabel?.lineBreakMode = .byTruncatingHead
        historyLabel?.lineBreakMode = .byTruncatingHead
        
        inputLabel?.numberOfLines = 0
        historyLabel?.numberOfLines = 0
        
        self.addSubview(inputLabel!)
        self.addSubview(historyLabel!)
        
        inputLabel?.snp.makeConstraints({ make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            make.height.equalToSuperview().multipliedBy(0.5).offset(-10)
        })
        
        historyLabel?.snp.makeConstraints({ make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalToSuperview().multipliedBy(0.5).offset(-10)
        })
    }
    
    func inputContent(content:String) {
        if !fingureArray.contains(content.last!) && !funcArray.contains(content) {
            return
        }
        
        if inputString.count > 0 {//前面已经输入过
            if fingureArray.contains(inputString.last!) {//判断前一个字符如果是数字 则后面是数字或符号都可以
                inputString.append(content)
                inputLabel?.text = inputString
            } else {
                if fingureArray.contains(content.last!) {//判断前一个如果是符号，则后面必须是数字
                    inputString.append(content)
                    inputLabel?.text = inputString
                    }

            }
        } else {//第一个输入的只能是数字
            if fingureArray.contains(content.last!) {
                inputString.append(content)
                inputLabel?.text = inputString
            }
        }
    }
    
    func refreshHistory() {
        historyString = inputString
        historyLabel?.text = historyString
    }
    //清空显示屏
    func clearContent() {
        inputString = ""
        inputLabel?.text = inputString
    }
    //删除上次输入的字符
    func deleteInput() {
        if inputString.count > 0 {
            inputString.removeLast()
            inputLabel?.text = inputString
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
