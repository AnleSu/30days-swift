//
//  MainTabbarController.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit

class MainTabbarController: UITabBarController {
    let home = HomeCoordinator()
    let learn = LearnCoordinator()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [home.navigationController, learn.splitViewController]
    }
}
