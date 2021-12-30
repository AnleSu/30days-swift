//
//  DetailViewController.swift
//  17-day  Spotlight Search
//
//  Created by Anlesu on 2021/11/4.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with model: Dictionary<String, Any>) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.white
        let cover = model["cover"] as? UIImage
        let des = model["description"] as? String
        let name = model["name"] as? String
        
        let coverImageView = UIImageView(frame: CGRect(x: 10, y: 80, width: 100, height: 140))
        self.view.addSubview(coverImageView)
        coverImageView.center.x = self.view.center.x
        coverImageView.image = cover
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: coverImageView.frame.maxY + 10, width: 300, height: 50))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.center.x = self.view.center.x
        self.view.addSubview(nameLabel)
        nameLabel.text = name
        
        let textView = UITextView(frame: CGRect(x: 10, y: nameLabel.frame.maxY + 20, width: self.view.frame.width, height: 500))
        self.view.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        textView.text = des
        textView.textColor = UIColor.black
    }
}
