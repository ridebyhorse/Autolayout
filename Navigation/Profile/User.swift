//
//  User.swift
//  Navigation
//
//  Created by Мария Можаева on 29.04.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage

protocol UserService {
    func provideUserData(_ userName: String) -> (User)
}

class User {
    
    var name: String
    var avatar: UIImage
    var status: String
    
    init(name: String, avatar: UIImage, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }

}
