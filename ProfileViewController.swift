//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 01.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private(set) lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Bottom button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.view.addSubview(button)
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }

}




