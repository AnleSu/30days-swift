//
//  Coordinator.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit

//五个主页面 都要遵守的协议
/**
 *我们可以在协议中添加属性，但需要注意以下几点：
 
 属性可以是实例属性和类型属性
 属性需要使用var修饰，不能属于let
 类型属性只能使用static修饰，不能使用class
 我们需要声明属性必须是可读的或者可读可写的

 */
protocol Coordinator: AnyObject {
    var splitViewController: UISplitViewController { get set }
}
