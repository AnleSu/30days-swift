//
//  ViewController.swift
//  14-day 动画
//
//  Created by Anlesu on 2021/10/14.
//

import UIKit
/**
 *Image Literal 从 Xcode8 起，编辑器就自带了一个图片辅助功能：Image Literal。让我们不在需要再安装额外插件。
 */
class ViewController: UIViewController {

    var blurView: UIVisualEffectView!  //磨玻璃效果的视图
    var alphaBtn: UIButton!
    var quoteBtn: UIButton!
    var chatBtn: UIButton!
    var photoBtn: UIButton!
    var linkBtn: UIButton!
    var audioBtn: UIButton!
    let dumpingRate: CGFloat = 0.7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bgImageView = UIImageView(frame: self.view.frame)
        bgImageView.isUserInteractionEnabled = true
        let image = UIImage(named: "LaunchImage-800")
        bgImageView.image = image
        self.view.addSubview(bgImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        bgImageView.addGestureRecognizer(tap)
        
        setupSubviews()
    }
    
    func setupSubviews() {
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissBlur))
        blurView.addGestureRecognizer(tap)
        blurView.frame = self.view.bounds
        blurView.alpha = 0;
        self.view.addSubview(blurView)
        alphaBtn = UIButton(frame: CGRect(x: -88, y: 80, width: 88, height: 88))
        alphaBtn.setImageAndTitle(imageName: "alpha", title: "Message", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(alphaBtn)

        quoteBtn = UIButton(frame: CGRect(x: -88, y: 246, width: 88, height: 88))
        quoteBtn.setImageAndTitle(imageName: "Quote", title: "Quote", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(quoteBtn)
        
        chatBtn = UIButton(frame: CGRect(x: -88, y: 406, width: 88, height: 88))
        chatBtn.setImageAndTitle(imageName: "Chat", title: "Chat", type: .PositionTop, space: 10)
        
        photoBtn = UIButton(frame: CGRect(x: self.view.frame.width + 88, y: 80, width: 88, height: 88))
        photoBtn.setImageAndTitle(imageName: "Photo", title: "Photo", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(photoBtn)
        
        linkBtn = UIButton(frame: CGRect(x: self.view.frame.width + 88, y: 246, width: 88, height: 88))
        linkBtn.setImageAndTitle(imageName: "Link", title: "Link", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(linkBtn)
        
        audioBtn = UIButton(frame: CGRect(x: self.view.frame.width + 88, y: 406, width: 88, height: 88))
        audioBtn.setImageAndTitle(imageName: "Audio", title: "Audio", type: .PositionTop, space: 10)
        blurView.contentView.addSubview(audioBtn)
        
        blurView.contentView.addSubview(chatBtn)
    }
    
    @objc func handleTap() {
       setupSubviews()
        showBlur()
    }
    
    func showBlur() {
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
        }
        /**
         *usingSpringWithDamping的范围为0.0f到1.0f，数值越小「弹簧」的振动效果越明显。
         *initialSpringVelocity则表示初始的速度，数值越大一开始移动越快。
         */
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.alphaBtn.frame.origin.x = 60
            self.photoBtn.frame.origin.x = 192
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.quoteBtn.frame.origin.x = 60
            self.linkBtn.frame.origin.x = 192
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.chatBtn.frame.origin.x = 60
            self.audioBtn.frame.origin.x = 192
        }, completion: nil)
    }
    
     @objc func dismissBlur() {
         UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
             self.blurView.alpha = 0
             self.alphaBtn.frame.origin.x = -88
             self.quoteBtn.frame.origin.x = -88
             self.chatBtn.frame.origin.x = -88
             
             self.linkBtn.frame.origin.x = self.view.frame.width + 88
             self.photoBtn.frame.origin.x = self.view.frame.width + 88
             self.audioBtn.frame.origin.x = self.view.frame.width + 88
         }) { (isFinished) in
             self.blurView.removeFromSuperview()
             self.alphaBtn.removeFromSuperview()
             self.quoteBtn.removeFromSuperview()
             self.linkBtn.removeFromSuperview()
             self.photoBtn.removeFromSuperview()
             self.audioBtn.removeFromSuperview()
             self.blurView.removeFromSuperview()
         }
    }


}

