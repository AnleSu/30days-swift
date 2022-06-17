//
//  Board.swift
//  FirstProject
//
//  Created by 宿安乐 on 2022/6/17.
//

import UIKit
import SnapKit

protocol BoardButtonInputDelegate {
    func boardButtonClick(content:String)
}
class Board: UIView {
    var dataArray = ["0",".","%","=",
    "1","2","3","+",
    "4","5","6","-",
    "7","8","9","*",
    "AC","Delete","^","/"]
    
    var delegate:BoardButtonInputDelegate?
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        installUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installUI() {
        var frontBtn:FuncButton!
        //从下向上 从左向右布局
        for index in 0..<20 {
            let btn = FuncButton()
            self.addSubview(btn)
            
            btn.snp.makeConstraints { make in
                //每一行的第一个 靠左侧摆放
                if index % 4 == 0 {
                    make.left.equalTo(0)
                } else {
                    make.left.equalTo(frontBtn.snp.right)
                }
                //从底部开始 第一行（最底下一行）靠屏幕底部摆放
                if index / 4 == 0 {
                    make.bottom.equalTo(0)
                } else if index % 4 == 0 {//不是最底下一行 但是是每行第一个
                    make.bottom.equalTo(frontBtn.snp.top)
                } else {
                    make.bottom.equalTo(frontBtn.snp.bottom)
                }
                
                make.width.equalToSuperview().multipliedBy(0.25)
                make.height.equalToSuperview().multipliedBy(0.2)
            }
            
            btn.tag = index + 100
            btn.setTitle(dataArray[index], for: .normal)
            btn.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside)
            frontBtn = btn
        }
    }
    
    @objc func btnClick(button:FuncButton) {
        if delegate != nil {
            delegate!.boardButtonClick(content: button.currentTitle!)
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

