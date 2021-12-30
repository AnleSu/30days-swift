//
//  PracticeCoordinator.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit

class PracticeCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
//        navigationController.coordinator = self
        
        let vc = HomeViewController.instantiate()
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), tag: 0)
//        vc.coordinator = self
        navigationController.viewControllers = [vc]
        
        
    }
}
