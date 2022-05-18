//
//  TestUserService.swift
//  Navigation
//
//  Created by Мария Можаева on 04.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class TestUserService: UserService {

    private let testUser = User(name: "Test User", avatar: .init(named: "logo")!, status: "Test status")

    func provideUserData(_ userName: String) -> (User) {
       
        return testUser
       
    }
    
    
}
