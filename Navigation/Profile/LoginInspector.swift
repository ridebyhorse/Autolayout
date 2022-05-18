//
//  LoginInspector.swift
//  Navigation
//
//  Created by Мария Можаева on 16.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol LoginFactory {
    
    func makeLoginInspector() -> LoginInspector
    
}

class LoginInspector: LoginViewControllerDelegate {
    
    func checkData(inputLogin: String, inputPswd: String) -> Bool {
        Checker.shared.checkPassword(inputLogin: inputLogin, inputPswd: inputPswd)
    }
    
    
}
