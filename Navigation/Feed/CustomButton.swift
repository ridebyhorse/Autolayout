//
//  CustomButton.swift
//  Navigation
//
//  Created by Мария Можаева on 20.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    var textCheckerDelegate: CustomButtonDelegate?
    
    var onTap:(() -> Void)?
    
    var textInput = {
        (button: CustomButton, text: String) -> Void in
        
        button.sendText(text)
    }
    
    init(buttonColor: UIColor, titleColor: UIColor) {
        super.init(frame: .zero)
        self.backgroundColor = buttonColor
        self.setTitleColor(titleColor, for: .normal)
        setup()
    }
    
    private func sendText(_ text: String) {
        textCheckerDelegate?.recieveTextToCheck(text: text)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ButtonModel) {
        self.setTitle(model.title, for: .normal)
    }
    
    private func setup() {
        self.layer.cornerRadius = 6
        self.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        onTap?()
    }
}


