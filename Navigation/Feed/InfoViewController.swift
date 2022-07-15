//
//  InfoViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 24.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let buttonModel: ButtonModel
    
    private lazy var showAlertButton: CustomButton = {
        let showPostbutton = CustomButton(buttonColor: .white, titleColor: .black)
        showPostbutton.translatesAutoresizingMaskIntoConstraints = false
        showPostbutton.onTap = {
            self.showAlert()
        }

        return showPostbutton
    }()

    
    init(model: Model) {
        self.buttonModel = model.showAlertButtonModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupSubviews()
        configure()
    }
    
    private func setupSubviews() {
        view.addSubview(showAlertButton)
        
        NSLayoutConstraint.activate([
            showAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showAlertButton.heightAnchor.constraint(equalToConstant: 40),
            showAlertButton.widthAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    private func configure() {
        let model = CustomButtonModel(title: buttonModel.title)
        showAlertButton.configure(with: model)
    }
    
    private func showAlert() {
        print("alert button pressed")
        let alertController = UIAlertController(title: "No information here", message: "Please try again", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in print("ok alert button pressed")}))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in print("cancel alert button pressed")}))
        self.present(
                alertController,
                animated: true,
                completion: nil
        )
    }

}
