//
//  SplitViewControllerDelegate.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/17.
//

import Foundation
import UIKit

class SplitViewControllerDelegate: UISplitViewControllerDelegate {
    static let shared = SplitViewControllerDelegate()
    
    private init() {}
    //开始时取消二级控制器,只显示详细控制器
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if secondaryViewController is SplitDefaultViewController {
            return true//在iPhone上 不设置 会先展示SplitDefaultViewController  返回才能到主页面
        } else {
            return false
        }
    }
}
