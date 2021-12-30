//
//  Badge.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/10.
//

import UIKit
//根据json创建struct  理解为model 用于解析json数据
//遵循可编码协议Decodable  或者 Codable
struct Badge: Decodable {
    /// The user-facing name for this badge.
    var name: String

    /// The user-facing description for this badge.
    var description: String

    /// A named color that specifies how this badge's icon should be tinted.
    var color: String

    /// These two specify how this badge should be unlocked.
    var criterion: String
    var value: String
    
    /// This converts the badge's name into its icon name
    var filename: String {
        let cleanBadgeName = name.replacingOccurrences(of: "[\\?',]", with: "", options: .regularExpression)
        return cleanBadgeName.replacingOccurrences(of: " ", with: "-")
    }

    /// The image for this badge.
    var image: UIImage {
        return UIImage(imageLiteralResourceName: "Badge-\(filename)")
    }
}
