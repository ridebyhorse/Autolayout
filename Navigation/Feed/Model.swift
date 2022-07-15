//
//  Model.swift
//  Navigation
//
//  Created by Мария Можаева on 25.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol Publishing: NSObject {
    func updateResult(result: Bool)
}

protocol CustomButtonDelegate {
    func recieveTextToCheck(text: String)
}

final class Model: NSObject, Publishing, CustomButtonDelegate {
    
    @objc dynamic private(set) var resultChecking = Bool()
    
    private var password: String = "True"
    
    lazy var showPostButtonModel: ButtonModel = {
        let showPostButtonViewModel = ButtonModel(title: "Show Post")
        return showPostButtonViewModel
    }()
    
    lazy var showAlertButtonModel: ButtonModel = {
        let showAlertButtonViewModel = ButtonModel(title: "Show Alert")
        return showAlertButtonViewModel
    }()
    
    lazy var checkWordButtonModel: ButtonModel = {
        let checkWordButtonModel = ButtonModel(title: "CheckWord")
        return checkWordButtonModel
    }()
    
    func updateResult(result: Bool) {
        resultChecking = result
    }
    
    private func check(_ inputText: String) {
        if inputText == password {
            self.updateResult(result: true)
        } else {
            self.updateResult(result: false)
        }
    }
    
    func recieveTextToCheck(text: String) {
        check(text)
    }
    
}
