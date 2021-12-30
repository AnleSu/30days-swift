//
//  StoryBoarded.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit
// 从StoryBoard中获取VC

protocol StoryBoarded { }
//Self 不仅指代的是 实现该协议的类型本身，也包括了这个类型的子类
extension StoryBoarded where Self: UIViewController {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyBoard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
