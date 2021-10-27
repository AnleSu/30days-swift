//
//  CustomButton.swift
//  14-day 动画
//
//  Created by Anlesu on 2021/10/26.
//

import Foundation
import UIKit

//image在button中的位置
enum ButtonImagePosition: Int {
    case PositionTop = 0
    case PositionBottom
    case PositionLeft
    case PositionRight
}

extension UIButton {
    func setImageAndTitle(imageName:String, title: String, type:ButtonImagePosition, space:CGFloat) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.setImage(UIImage(named: imageName), for: .normal)
        
        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!
        
        var labelWidth: CGFloat!
        var labelHeight: CGFloat!
        if Float(UIDevice.current.systemVersion)! >= 8.0 {
            labelWidth = self.titleLabel?.intrinsicContentSize.width
            labelHeight = self.titleLabel?.intrinsicContentSize.height
        } else {
            labelWidth = self.titleLabel?.frame.size.width
            labelHeight = self.titleLabel?.frame.size.height
        }
        
        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsets()
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsets()
        
        /**
         *默认的状态是图片在左，标题在右，而且image和title之间没有空隙
         *image的UIEdgeInsets属性的top，left，bottom都是相对于按钮的，right是相对于title；
          title的UIEdgeInsets属性的top，bottom，right都是相对于按钮的，left是相对于image；
         */
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-space/2.0, right: 0);
            break;
        case .PositionLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
            break;
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWidth, bottom: 0, right: 0);
            break;
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-space/2.0, bottom: 0, right: imageWidth+space/2.0);
            break;
        }
        
        self.titleEdgeInsets = titleEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}
