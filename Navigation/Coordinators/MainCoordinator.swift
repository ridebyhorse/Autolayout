//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Мария Можаева on 28.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class MainCoordinator: TabBarCoordinator {
    
    var navigation: UINavigationController
    var navigationProfile: UINavigationController
    var tabbar: UITabBarController
    
    var onComplete: (() -> Void)?
    
    var childCoordinators: [Coordinator] = []
    
    init() {
        tabbar = UITabBarController()
        navigation = UINavigationController()
        navigationProfile = UINavigationController()
    }
    
    func start() {
        configureFeedPage()
        configureProfilePage()
        tabbar.view.backgroundColor = .white
        tabbar.viewControllers = [navigation, navigationProfile]
        
        for i in childCoordinators {
            i.start()
        }
    }
    
    // модуль новостной ленты
    private func configureFeedPage()  {
        
        let inputFeed = FeedFlowCoordinator.Input.init(data: "Feed")
        
        let feedCoordinator = FeedFlowCoordinator(
            controller: navigation,
            parent: self,
            input: inputFeed
        )
        
        childCoordinators.append(feedCoordinator)
        
        feedCoordinator.onComplete = {
            print("Выход из координатора новостной ленты")
        }
    }
    
    //модуль профиля
    private func configureProfilePage()  {
        
        let inputProfile = ProfileFlowCoordinator.Input.init(data: "Profile")
        
        let profileCoordinator = ProfileFlowCoordinator(
            controller: navigationProfile,
            parent: self,
            input: inputProfile
        )
        
        childCoordinators.append(profileCoordinator)
        
        profileCoordinator.onComplete = {
            print("Выход из координатора профиля")
        }
    }

}
