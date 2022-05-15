//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Мария Можаева on 29.04.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class CurrentUserService: UserService {

    private let user = User(name: "Lucky Monkey", avatar: .init(named: "avatar_1")!, status: "Can't stop coding")
    
    private let defaultUser = User(name: "Unknown User", avatar: .init(systemName: "questionmark.circle.fill")!, status: " ")
    
    func provideUserData(_ userName: String) -> (User) {
        if userName == user.name {
            return user
        } else {
            print("There is no \(userName) user")
            return defaultUser
        }
    }


}
