//
//  NeteaseURL.swift
//  NeteaseCloudMusic-homepage-swift
//
//  Created by Anlesu on 2021/12/27.
//

import Foundation

struct Constant {
    static let baseURL = "http://10.200.22.108/"
}

enum NeteaseURL:String {
    case Home = "homepage/block/page"
    case Menu = "homepage/dragon/ball"
    
    public var urlString: String {
        "\(Constant.baseURL)\(self.rawValue)"
    }
}
