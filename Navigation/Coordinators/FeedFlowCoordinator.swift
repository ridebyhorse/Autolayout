//
//  FeedFlowCoordinator.swift
//  Navigation
//
//  Created by Мария Можаева on 28.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedFlowCoordinator: Coordinator {
    
    struct Input {
        var data: String
    }
    
    var childCoordinators: [Coordinator] = []
    
    var onComplete: (() -> Void)?
    
    var navigation: UINavigationController
    
    unowned let parentCoordinator: MainCoordinator
    
    private var input: Input?
    
    init(
        controller: UINavigationController,
        parent: MainCoordinator,
        input: Input
    ) {
        self.navigation = controller
        self.parentCoordinator = parent
        self.input = input
    }
    
    func start() {
    
        let model = Model()
        
        let feedController = MainFeedViewController(model: model)
        
        navigation.title = "Feed"
        navigation.tabBarItem.image = UIImage(systemName: "lineweight")
        navigation.navigationBar.topItem?.title = input?.data
        navigation.pushViewController(feedController, animated: true)
    }
    
    private func exitFromFeedModule() {
        onComplete?()
    }
}
