//
//  BannerViewModel.swift
//  NeteaseCloudMusic-homepage-swift
//
//  Created by Anlesu on 2021/12/16.
//

import Foundation
import UIKit

class BannerViewModel: HomeViewModelSection {
    var type: HomeViewModelSectionType {
        return .BANNER
    }
    
    var rowHeight: CGFloat
    
    var frame: CGRect
    
    var banners: [Banner]!
    
    init(banners: [Banner]) {
        self.banners = banners
        self.frame = BannerViewModel.caculateFrame()
        self.rowHeight = self.frame.size.height
    }
    
    class func caculateFrame() -> CGRect {
        let height: CGFloat = sectionD_height * scaleH
        let width: CGFloat = kScreenWidth
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
}
