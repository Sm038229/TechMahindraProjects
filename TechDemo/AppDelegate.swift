//
//  AppDelegate.swift
//  TechDemo
//
//  Created by SachchidaNand Mishra on 18/07/20.
//  Copyright © 2020 Sachchida Nand Mishra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //
        let navigationController = TechNavigationViewController()
        let rootViewController = TechViewController()
        //rootViewController.title = "List"
        navigationController.viewControllers = [rootViewController]
        //
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }
}

