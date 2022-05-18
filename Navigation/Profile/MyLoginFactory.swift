//
//  MyLoginFactory.swift
//  Navigation
//
//  Created by Мария Можаева on 18.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

struct MyLoginFactory: LoginFactory {

    func makeLoginInspector() -> LoginInspector {
        
        let inspector = LoginInspector()
        return inspector
        
    }
    
}
