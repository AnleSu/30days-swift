//
//  CoordinatedNavigationController.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit
/** 知识点：
 *weak:弱引用对象的引用计数不会+1, 必须为可选类型变量
 *在声明弱引用对象是必须用var关键字, 不能用let.
 *建议delegate使用weak修饰
 */
class CoordinatedNavigationController: UINavigationController {
    weak var coordinator: Coordinator?
}
