//
//  ViewController.swift
//  15day - 动画1
//
//  Created by Anlesu on 2021/10/27.
//

import UIKit

class ViewController: UIViewController {
    let bottomBtnH: CGFloat = 60
    var loginBtn: UIButton!
    var siginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        
        self.view.backgroundColor = UIColor.lightGray
        
        setupSubviews()
    }
    
    func setupSubviews() {
        let  logoImgView = UIImageView(image: UIImage(named: "logo"))
        logoImgView.frame = CGRect(x: 0, y: 50, width: 334, height: 101)
        self.view.addSubview(logoImgView)
        logoImgView.center.x = self.view.center.x
        
        loginBtn = UIButton(frame: CGRect(x: 0, y: self.view.frame.size.height - bottomBtnH - 30, width: self.view.frame.size.width / 2.0, height: bottomBtnH))
        loginBtn.setTitle("LGO IN", for: .normal)
        loginBtn.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginBtn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        self.view.addSubview(loginBtn)
        
        siginBtn = UIButton(frame: CGRect(x: self.loginBtn.frame.maxX, y: self.view.frame.size.height - bottomBtnH - 30, width: self.view.frame.size.width / 2.0, height: bottomBtnH))
        siginBtn.setTitle("SIGN IN", for: .normal)
        siginBtn.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        siginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        siginBtn.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        self.view.addSubview(siginBtn)
    }
    
    @objc func handleLogin() {
        let loginVC = LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated: true)
    }


}

