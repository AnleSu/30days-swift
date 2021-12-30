//
//  LoginViewController.swift
//  15day - 动画1
//
//  Created by Anlesu on 2021/10/27.
//

import Foundation
import UIKit
class LoginViewController: UIViewController {
    var nameText: UITextField!
    var passWordText: UITextField!
    var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSubviews()
        showAnimation()
    }
    
    func setupSubviews() {
        nameText = UITextField(frame: CGRect(x: -270, y: 180, width: 270, height: 40))
        nameText.borderStyle = .roundedRect
        nameText.placeholder = "Name"
        self.view.addSubview(nameText)
        
        passWordText = UITextField(frame: CGRect(x: -270, y: 250, width: 270, height: 40))
        passWordText.borderStyle = .roundedRect
        passWordText.placeholder = "Password"
        self.view.addSubview(passWordText)
        
        submitBtn = UIButton(frame: CGRect(x: -125, y: 330, width: 125, height: 40))
        submitBtn.setTitle("Login", for: .normal)
        submitBtn.backgroundColor = UIColor(red: 22/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1)
        submitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.layer.cornerRadius = 6
        submitBtn.layer.borderColor = UIColor.lightGray.cgColor
        submitBtn.layer.borderWidth = 1
        self.view.addSubview(submitBtn)
    }
    
    func showAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            self.nameText.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            self.passWordText.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            self.submitBtn.center.x = self.view.center.x
        }) { (finished) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
                self.submitBtn.frame.size.width = 180
                self.submitBtn.center.x = self.view.center.x
            }, completion: nil)
        }
    }
    
    
}
