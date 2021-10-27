//
//  VideoSplashViewController.swift
//  12-day 视频播放
//
//  Created by Anlesu on 2021/10/13.
//

import Foundation
import UIKit
import AVKit

public enum VideoFillMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

public class VideoSplashViewController: UIViewController {
    public let moviePlayer = AVPlayerViewController()
    public var contentURL: NSURL = NSURL() {
        didSet {
            self.setMoviePlayer(url: contentURL)
        }
    }
    public var videoFrame: CGRect = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration: CGFloat = 0.0
    public var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    public var sound:Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            } else {
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    public var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    public var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self, selector: #selector(VideoSplashViewController.playerItemDidReachEnd), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    public var fillMode: VideoFillMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravity.resize
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravity.resizeAspect
            }
            
        }
    }
    
    private var moviePlayerSoundLevel: Float = 1.0
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        self.view.addSubview(moviePlayer.view)
        
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setMoviePlayer(url:NSURL) {
        let cutter = VideoURLCutter()
        cutter.cropVideoURL(videoURL: url, startTime: startTime, duration: duration) { videoPath, error in
            if let path = videoPath as NSURL? {
                self.moviePlayer.player = AVPlayer(url: path as URL)
                self.moviePlayer.player?.play()
                self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
            }
        }
    }
    
    @objc func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: CMTime.zero)
        moviePlayer.player?.play()
    }
}
