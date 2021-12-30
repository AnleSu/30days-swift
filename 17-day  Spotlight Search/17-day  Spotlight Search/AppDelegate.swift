//
//  AppDelegate.swift
//  17-day  Spotlight Search
//
//  Created by Anlesu on 2021/10/28.
//

import UIKit
import CoreSpotlight

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    public let notificationName = NSNotification.Name.init(rawValue: "SpotlightSearchNotification")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    下面两方法 点击Spotlight 搜索结果之后都不执行
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        let identifier = userActivity.userInfo!["kCSSearchableItemActivityIdentifier"] as! String
        NotificationCenter.default.post(name: notificationName, object: self, userInfo: ["identifier": identifier])
        return true
        
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                         restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
            if userActivity.activityType == CSSearchableItemActionType {
                let uniqueIdentifier = userActivity
                    .userInfo?[CSSearchableItemActivityIdentifier] as? String
                print("点击的索引ID为：\(uniqueIdentifier)")
                //执行后续操作.....
            }
            return true
        }


}

