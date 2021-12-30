//
//  DetailViewController.swift
//  16-day 3D Touch
//
//  Created by Anlesu on 2021/10/28.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var imageView:UIImageView = UIImageView()
    
    var image:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame  = self.view.frame
        self.view.addSubview(imageView)
        imageView.image = image
    }
}
