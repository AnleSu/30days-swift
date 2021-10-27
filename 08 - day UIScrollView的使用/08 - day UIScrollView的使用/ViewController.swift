//
//  ViewController.swift
//  08 - day UIScrollView的使用
//
//  Created by Anlesu on 2021/10/11.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var imageView: UIImageView!
    var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "samplePhoto")
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1.0
        scrollView.backgroundColor = UIColor.black
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
  
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }


}

