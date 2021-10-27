//
//  ViewController.swift
//  11 - day UIPickerViewde shiyong
//
//  Created by Anlesu on 2021/10/13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    var machine: UIPickerView!
    var emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]
    var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createSubViews()
        self.randomSource()
    }
    
    @objc func handleButton() {
        if machine.selectedRow(inComponent: 0) == machine.selectedRow(inComponent: 1) && machine.selectedRow(inComponent: 1) == machine.selectedRow(inComponent: 2) {
            result.text = "👏👏👏"
        }
        else {
            result.text = "💔💔💔"
        }
    }


    func createSubViews() {
        machine = UIPickerView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 320))
        machine.delegate = self
        machine.dataSource = self
        self.view.addSubview(machine)
        
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor.blue
        button.frame = CGRect(x: 0, y: 0, width: 275, height: 40)
        button.center.x = self.view.center.x
        button.center.y = self.machine.center.y + 200
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.setTitle("Judge", for: .normal)
        button.setTitleColor(.white, for: .normal)
        self.view.addSubview(button)
        
        result = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        result.center.y = button.center.y + 80
        result.textAlignment = .center
        result.font = UIFont.systemFont(ofSize: 20)
        result.textColor = .red
        self.view.addSubview(result)
    }
    
    func randomSource() {
        machine.selectRow(Int(arc4random()) % (emojiArray.count - 2) + 1, inComponent: 0, animated: true)
        machine.selectRow(Int(arc4random()) % (emojiArray.count - 2) + 1, inComponent: 1, animated: true)
        machine.selectRow(Int(arc4random()) % (emojiArray.count - 2) + 1, inComponent: 2, animated: true)
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = emojiArray[row]
        pickerLabel.textAlignment = .center
        pickerLabel.font = UIFont.systemFont(ofSize: 56)
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
}

