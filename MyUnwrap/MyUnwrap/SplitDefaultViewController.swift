//
//  SplitDefaultViewController.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/17.
//

import UIKit
enum ActivityType {
    case home
    case learn
    case practice
    case challenges
    case news
}


class SplitDefaultViewController: UIViewController {
    var logo: ShapeView!
    var prompt: UILabel!
    
    var selectionMode = ActivityType.learn
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createSubViews()
        createSubViewsConstraints()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoTapped))
        logo.addGestureRecognizer(tap)
        
        switch selectionMode {
        case .learn:
            prompt.text = "Please select a topic to learn"

        case .challenges:
           
            prompt.text = "Start today's challenge when you're ready"

        case .news:
            prompt.text = "Please select an article to read"

        case .practice:
            prompt.text = "Please select a practice activity to begin"

        default:
            prompt.text = ""
        }
    }
    
    @objc func logoTapped() {
        logo.draw(delay: 0, duration: 2, keyFrameValues: [0, 0.129, 0.373, 0.58, 0.928, 1.0])
    }
    
    func createSubViews() {
        logo = ShapeView()
        logo.path = UIBezierPath.logo
        self.view.addSubview(logo)
        
        prompt = UILabel()
        prompt.textColor = .lightGray
//        prompt.font = UIFont.systemFont(ofSize: 15)
        prompt.textAlignment = .center
        self.view.addSubview(prompt)
    }
    
    func createSubViewsConstraints() {
        logo.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 250, height: 250))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-10)
        }
        prompt.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
