//
//  Reusable.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/10.
//

import UIKit

//定义一个 Reusable 协议，遵从这个协议需要有一个静态属性 identifier
protocol Reusable: AnyObject {
    //复用的id
    static var identifier: String {get}
}

//利用 swift extention 的特性，让 UIView 默认以类名作为 identifier
extension Reusable where Self: UIView {
    static var identifier: String {
        return NSStringFromClass(self)
    }
}
