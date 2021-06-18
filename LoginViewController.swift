//
//  LoginViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 14.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginView = UIView()
    private var logo = UIImageView(image: UIImage(named: "logo"))
    private var emailOrPhoneTextField = UITextField()
    private var passwordTextField = UITextField()
    private var formField = UIView()
    private var separateLine = UIView()
    private var logInButton = UIButton()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.backgroundColor = .white
        
        loginView.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        loginView.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false

        loginView.addSubview(formField)
        formField.translatesAutoresizingMaskIntoConstraints = false
        
        formField.addSubview(emailOrPhoneTextField)
        emailOrPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        formField.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        formField.addSubview(separateLine)
        separateLine.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 100),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            loginView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            logo.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor),
            formField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            formField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            formField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            formField.heightAnchor.constraint(equalToConstant: 100),
            separateLine.centerYAnchor.constraint(equalTo: formField.centerYAnchor),
            separateLine.widthAnchor.constraint(equalTo: formField.widthAnchor),
            separateLine.heightAnchor.constraint(equalToConstant: 0.5),
            emailOrPhoneTextField.topAnchor.constraint(equalTo: formField.topAnchor),
            emailOrPhoneTextField.bottomAnchor.constraint(equalTo: separateLine.topAnchor),
            emailOrPhoneTextField.leadingAnchor.constraint(equalTo: formField.leadingAnchor, constant: 12),
            emailOrPhoneTextField.trailingAnchor.constraint(equalTo: formField.trailingAnchor, constant: 12),
            passwordTextField.topAnchor.constraint(equalTo: separateLine.bottomAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: formField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: formField.leadingAnchor, constant: 12),
            passwordTextField.trailingAnchor.constraint(equalTo: formField.trailingAnchor, constant: 12),
            logInButton.topAnchor.constraint(equalTo: formField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: formField.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: formField.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ]
    
        
        NSLayoutConstraint.activate(constraints)
        
        logo.clipsToBounds = true
        formField.backgroundColor = .systemGray6
        formField.layer.cornerRadius = 10
        formField.layer.borderWidth = 0.5
        formField.layer.borderColor = UIColor.lightGray.cgColor
        formField.clipsToBounds = true
        separateLine.backgroundColor = .lightGray
        emailOrPhoneTextField.textColor = .black
        emailOrPhoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailOrPhoneTextField.placeholder = "Email or phone"
        emailOrPhoneTextField.tintColor = UIColor(named: "vkColor")
        emailOrPhoneTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.placeholder = "Password"
        passwordTextField.tintColor = UIColor(named: "vkColor")
        passwordTextField.autocapitalizationType = .none
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.textColor = .white
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        logInButton.layer.cornerRadius = 10
        
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        if logInButton.state == .selected {
            logInButton.alpha = 0.8
        } else if logInButton.state == .highlighted {
            logInButton.alpha = 0.8
        } else if logInButton.state == .disabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1
        }
        logInButton.clipsToBounds = true
        
        logInButton.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func didTapLogInButton() {
        let profileVC = storyboard?.instantiateViewController(identifier: "profileVC")
        navigationController?.pushViewController(profileVC!, animated: true)
    }
    
}




