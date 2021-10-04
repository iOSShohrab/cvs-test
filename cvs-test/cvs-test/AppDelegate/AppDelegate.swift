//
//  AppDelegate.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import UIKit

/**
 TODO ::
 
 1. Parsing string for author & heigh, width need to update with regiex parser
 2. Need to create QUEUE base network service call to handle multiple server request async
 3. Need to add a Logger to Log only Debug mode
 4. Can replace third party SDK SDWebImage and implement own image cache engine
 
 */



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

