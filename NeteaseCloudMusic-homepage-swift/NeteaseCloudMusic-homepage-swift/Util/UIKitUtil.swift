//
//  UIKitUtil.swift
//  NeteaseCloudMusic-homepage-swift
//
//  Created by Anlesu on 2021/12/16.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width // max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
let kSreenHeight = UIScreen.main.bounds.height // min(UIScreen.main.bounds.height, UIScreen.main.bounds.width)
let kSreenBounds = UIScreen.main.bounds

let kLeftMargin: CGFloat = 20.0
let kTopMargin: CGFloat = 20.0

let scaleW: CGFloat = CGFloat(kScreenWidth / 414)
let scaleH: CGFloat = CGFloat(kSreenHeight / 667)

let sectionA_height: CGFloat = 200 + 40

let sectionB_height: CGFloat = 140 + 40

let sectionC_height: CGFloat = 100

let sectionD_height: CGFloat = 180

let sectionE_height: CGFloat = 250 + 40

/// 布局 A Cell 的宽度
let itemA_width: CGFloat = 120

/// headview 高
let HEADVIEW_H: CGFloat = 40
