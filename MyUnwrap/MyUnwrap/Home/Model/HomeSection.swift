//
//  HomeSection.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/10.
//

import Foundation

enum HomeSectionType {
    case status
    case score
    case stats
    case streak
    case badges
    
}

//几种不同类型的cell
enum HomeItemType {
    case status
    case summary
    case stat(textLabel: String, detailLabel: String, accessibilityLabel: String)//枚举值可根据参数构建 参数是三个字符串值
    case share
    case badge
}

struct HomeItem {
    var name: String?
    var type: HomeItemType
}

struct HomeSection {
    let title: String?
    let type: HomeSectionType
    let items: [HomeItem]
}
