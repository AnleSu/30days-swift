//
//  LearnCoordinator.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit

class LearnCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    var navigationController: CoordinatedNavigationController?
    
    //Learn Practice Challenges都要要考虑 iPad上分屏显示  有一个默认页面
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self

        let vc = LearnViewController(style: .plain)
        vc.coordinator = self
        navigationController.viewControllers = [vc]
        
        let defaultVC = SplitDefaultViewController()
        defaultVC.selectionMode = .learn
        
        splitViewController.viewControllers = [navigationController, defaultVC]
        splitViewController.tabBarItem = UITabBarItem(title: "Learn", image: UIImage(named: "Learn"), tag: 1)

        splitViewController.preferredDisplayMode = .allVisible
        splitViewController.delegate = SplitViewControllerDelegate.shared
        
    }
}
