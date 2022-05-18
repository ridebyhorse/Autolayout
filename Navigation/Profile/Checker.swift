//
//  Checker.swift
//  Navigation
//
//  Created by Мария Можаева on 16.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class Checker {
    
    private let login: String
    
    private let pswd: String
    
    static let shared: Checker = {
        
        let checker = Checker()
        
        return checker
        
    }()
    
    private init() {
        login = "Lucky Monkey"
        pswd = "Banana"
    }
    
    func checkPassword(inputLogin: String, inputPswd: String) -> Bool {
        
        if inputLogin.hash == login.hash && inputPswd.hash == pswd.hash {
            return true
        } else {
            return false
        }
    }

}
