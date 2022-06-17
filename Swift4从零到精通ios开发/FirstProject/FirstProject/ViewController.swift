//
//  ViewController.swift
//  FirstProject
//
//  Created by 宿安乐 on 2022/6/17.
//

import UIKit

class ViewController: UIViewController, BoardButtonInputDelegate {
    func boardButtonClick(content: String) {
        
        if content == "AC" || content == "Delete" || content == "=" {
            switch content {
            case "AC":
                screen.clearContent()
                screen.refreshHistory()
            case "Delete":
                screen.deleteInput()
            case "=":
                let result = calculator.calculatEquation(equation: screen.inputString)
                screen.refreshHistory()
                screen.clearContent()
                screen.inputContent(content: String(result))
                isNew = true
            default:
                screen.refreshHistory()
            }
        } else {
            if isNew {
                screen.clearContent()
                isNew = false
            }
            screen.inputContent(content: content)
        }
    }
    
    let board = Board()
    let screen = Screen()
    let calculator = CalculatorEngine()
    var isNew = false//标记上一次计算结束 再输入清空之前的结果 重新计算
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(board)
        board.delegate = self
        board.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(2/3.0)
        }
        
        self.view.addSubview(screen)
        screen.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalTo(board.snp.top)
        }
    }
    
}

