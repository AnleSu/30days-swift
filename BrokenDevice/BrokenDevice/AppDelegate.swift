//
//  AppDelegate.swift
//  BrokenDevice
//
//  Created by Anlesu on 2021/9/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        isBrokenDevice()
        return true
    }
    ///判断是否是越狱设备
    /// - Returns: true 表示设备越狱
    func isBrokenDevice() -> Bool {
        var isBrokenDevice = false
        let cydiaPath = "/Applications/Cydia.app"
        let aptPath = "/private/var/lib/apt"
        
        if FileManager.default.fileExists(atPath: cydiaPath) {
            isBrokenDevice = true
        }
        
        if FileManager.default.fileExists(atPath: aptPath) {
            isBrokenDevice = true
        }
        return isBrokenDevice
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

