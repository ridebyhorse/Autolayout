//
//  Coordinator.swift
//  Navigation
//
//  Created by Мария Можаева on 28.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start() 
    var onComplete: (() -> Void)? { get set }
}
protocol TabBarCoordinator: Coordinator {
    var tabbar: UITabBarController { get }
}
