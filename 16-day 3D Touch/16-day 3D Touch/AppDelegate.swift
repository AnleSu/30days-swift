//
//  AppDelegate.swift
//  16-day 3D Touch
//
//  Created by Anlesu on 2021/10/27.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setup3DTouch(application)
        
        
        return true
    }
    
    func setup3DTouch(_ application: UIApplication) {
        let icon = UIApplicationShortcutIcon(type: .love)
        let loveAction = UIApplicationShortcutItem(type: "play", localizedTitle: "Love", localizedSubtitle: nil, icon: icon, userInfo: nil)
        application.shortcutItems = [loveAction]
    }
    
    // iOS13之前，使用AppDelegate的代理方法
    // iOS13之后，AppDelegate的代理方法不会被调用，需要使用SceneDelegate的代理方法
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        print("使用了3D touch")
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "ShortcutItem"), object: nil, userInfo: ["shortcutItem": shortcutItem])
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


}

