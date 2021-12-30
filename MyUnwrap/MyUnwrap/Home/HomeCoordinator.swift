//
//  HomeCoordinator.swift
//  MyUnwrap
//
//  Created by Anlesu on 2021/11/8.
//

import UIKit
//可以理解为viewModel层 处理业务逻辑
class HomeCoordinator: Coordinator {
    var splitViewController = UISplitViewController()
    //这里定义了navigationController和一个确定的类型CoordinatedNavigationController  并且没有初始化
    //下面自定义的init方法中 就必须要给navigationController初始化 否则报错
    //或者可以给navigationController定义为一个可选类型
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.coordinator = self
        
        let vc = HomeViewController(collectionViewLayout: UICollectionViewLayout())
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home"), tag: 0)
        vc.coordinator = self
        navigationController.viewControllers = [vc]
        
        
    }
}
