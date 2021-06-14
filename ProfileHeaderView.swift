//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария Можаева on 01.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var setStatusButton: UIButton!
    
    private var statusText = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        
        guard let avatarImageView = avatarImageView,
              let statusTextField = statusTextField,
              let setStatusButton = setStatusButton
                else {
                    return
        }
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        statusTextField.addTarget(self, action: #selector(statusChanged), for: .editingChanged)
        
        
        
    }
    
    @objc func statusChanged() {
        statusText = statusTextField.text ?? " "
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }

}
