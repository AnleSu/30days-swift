//
//  FuncButton.swift
//  FirstProject
//
//  Created by 宿安乐 on 2022/6/17.
//

import Foundation
import UIKit
class FuncButton:UIButton {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1.0).cgColor
        self.setTitleColor(UIColor.orange, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.setTitleColor(.black, for: .highlighted)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
