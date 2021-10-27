//
//  ViewController.swift
//  12-day 视频播放
//
//  Created by Anlesu on 2021/10/13.
//

import UIKit

class ViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupVideoBackground()
    }

    func setupVideoBackground() {
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
    
        videoFrame = view.frame
        fillMode = .ResizeAspect
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
//        duration = 10
        contentURL = url as NSURL
    }
}

