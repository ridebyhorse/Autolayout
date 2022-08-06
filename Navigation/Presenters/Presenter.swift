//
//  Presenter.swift
//  Navigation
//
//  Created by Мария Можаева on 01.08.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol ModuleOneOutput {
    var onSelectParameter: ((String) -> Void)? { get set }
}

protocol ModuleOneInput {
    var buttonModuleTitle: String? { get set }
}

class Presenter: ViewOutput, ModuleOneOutput, ModuleOneInput {
    
    var buttonModuleTitle: String? {
        didSet {
            viewInput?.configureButton(title: buttonModuleTitle!)
        }
    }
    
    var onSelectParameter: ((String) -> Void)?
    
    weak var viewInput: ViewInput?
    
    lazy var onSelect: ((String) -> Void)? = { string in
        self.onSelectParameter?(string)
    }
}
