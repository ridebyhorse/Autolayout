//
//  ProfileFlowCoordinator.swift
//  Navigation
//
//  Created by Мария Можаева on 28.07.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol MVPFabric {
    func makePresenter() -> Presenter
}

class ProfileFlowCoordinator: Coordinator, MVPFabric {
    
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
    
    func makePresenter() -> Presenter {
        let presenter = Presenter()
        return presenter
    }
    
    private func configureLoginModule() -> UIViewController {
        
        let presenter = makePresenter()
        let factory = MyLoginFactory()
        
        // ModuleOne output
        presenter.onSelectParameter = { string in
            print("Opened profile page \(string)")
        }
        
        let loginController = LoginViewController(inspector: factory.makeLoginInspector(), output: presenter)
        presenter.viewInput = loginController
        
        // ModuleOne input
        presenter.buttonModuleTitle = "Log In"
        
        return loginController
    }
    
    func start() {
        
        let loginController = configureLoginModule()
        
        navigation.title = input?.data
        navigation.tabBarItem.image = UIImage(systemName: "person.fill")
        navigation.pushViewController(loginController, animated: true)
    }
    
    private func exitFromProfileModule() {
        onComplete?()
    }
}
