//
//  FeedViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 24.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol Observing {
    var observations: [NSKeyValueObservation] { get }
    func killObservations()
}

struct ButtonModel {
    
    let title: String
}

class MainFeedViewController: UIViewController, Observing {
    
    private var checkingObservation = Bool()
    
    private(set) var observations: [NSKeyValueObservation] = []
    
    lazy var textToCheck = String()
    
    private let buttonModel: ButtonModel
    
    private lazy var showPostButton: CustomButton = {
        let showPostbutton = CustomButton(buttonColor: .yellow, titleColor: .black)
        showPostbutton.translatesAutoresizingMaskIntoConstraints = false
        showPostbutton.onTap = {
            self.showPost()
        }
        
        return showPostbutton
    }()
    
    private lazy var checkLabel: UILabel = {
        let checkLabel = UILabel()
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return checkLabel
    }()
    
    private lazy var checkWordTextField: UITextField = {
        let checkWordTextField = UITextField()
        checkWordTextField.translatesAutoresizingMaskIntoConstraints = false
        checkWordTextField.layer.borderWidth = 1
        checkWordTextField.layer.borderColor = UIColor.black.cgColor
        checkWordTextField.backgroundColor = .white
        checkWordTextField.layer.cornerRadius = 6
        checkWordTextField.textColor = .black
        checkWordTextField.placeholder = "Type a word to check it..."
        
        return checkWordTextField
    }()
    
    private lazy var checkWordButton: CustomButton = {
        
        let checkWordButton = CustomButton(buttonColor: .blue, titleColor: .white)
        checkWordButton.translatesAutoresizingMaskIntoConstraints = false
        
        checkWordButton.onTap = {
            self.checkButtonTapped()
            checkWordButton.textInput(checkWordButton, self.textToCheck)
            
            if self.checkingObservation {
                self.checkLabel.textColor = .green
                self.checkLabel.text = "Correct!"
            } else {
                self.checkLabel.textColor = .red
                self.checkLabel.text = "Incorrect! Try Again.."
            }
        }
        
        return checkWordButton
    }()
    
    init(model: Model) {
        self.buttonModel = model.showPostButtonModel
        
        super.init(nibName: nil, bundle: nil)
        self.checkWordButton.textCheckerDelegate = model
        self.observeCheckingResult(publisher: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        configure()
    }
    
    func observeCheckingResult(publisher: Model) {
        let observation = publisher.observe(\.resultChecking, options: [.new]) { _, value in
            print("Result of checking is \(String(describing: value.newValue))")
            self.checkingObservation = value.newValue ?? false
        }
        observations.append(observation)
    }
    
    func killObservations() {
        observations = []
    }
    
    deinit {
        killObservations()
    }
    
    private func setupSubviews() {
        view.addSubview(showPostButton)
        view.addSubview(checkWordButton)
        view.addSubview(checkWordTextField)
        view.addSubview(checkLabel)
        
        NSLayoutConstraint.activate([
            showPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showPostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showPostButton.heightAnchor.constraint(equalToConstant: 40),
            showPostButton.widthAnchor.constraint(equalToConstant: 140),
            checkWordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkWordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            checkWordButton.heightAnchor.constraint(equalToConstant: 40),
            checkWordButton.widthAnchor.constraint(equalToConstant: 140),
            checkWordTextField.bottomAnchor.constraint(equalTo: checkWordButton.topAnchor, constant: -20),
            checkWordTextField.heightAnchor.constraint(equalToConstant: 40),
            checkWordTextField.widthAnchor.constraint(equalToConstant: 240),
            checkWordTextField.centerXAnchor.constraint(equalTo: checkWordButton.centerXAnchor),
            checkLabel.bottomAnchor.constraint(equalTo: checkWordTextField.topAnchor, constant: -20),
            checkLabel.centerXAnchor.constraint(equalTo: checkWordTextField.centerXAnchor)
        ])
    }
    
    private func configure() {
        
        let model = ButtonModel(title: buttonModel.title)
        let checkButtonModel = Model().checkWordButtonModel
        let cbModel = ButtonModel(title: checkButtonModel.title)
        
        showPostButton.configure(with: model)
        checkWordButton.configure(with: cbModel)
    }
    
    private func showPost() {
        print("post button pressed")
        let feedPostVC = FeedPostViewController()
        feedPostVC.title = "Current Post"
        self.navigationController?.pushViewController(feedPostVC, animated: true)
    }
    
    private func checkButtonTapped() {
        textToCheck = checkWordTextField.text ?? ""
        checkWordTextField.text = ""
    }

}


