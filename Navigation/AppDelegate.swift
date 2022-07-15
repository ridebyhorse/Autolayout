//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        let factory = MyLoginFactory()
        
        let model = Model()
        let profileController = LoginViewController(inspector: factory.makeLoginInspector())
        let feedController = MainFeedViewController(model: model)
        
        let feedNavigationController = UINavigationController(rootViewController: feedController)
        feedNavigationController.title = "Feed"
        feedNavigationController.tabBarItem.image = UIImage(systemName: "lineweight")
        feedNavigationController.navigationBar.topItem?.title = "Feed"

        
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.title = "Profile"
        profileNavigationController.tabBarItem.image = UIImage(systemName: "person.fill")

        
        let tabbarController = UITabBarController()
        tabbarController.view.backgroundColor = .white
        tabbarController.viewControllers = [feedNavigationController, profileNavigationController]
        
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
        
        return true
    }

   
}

