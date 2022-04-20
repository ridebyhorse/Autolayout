//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария Можаева on 12.01.2022.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private var statusText: String?
    
    private let profileView: UIView = {
        let profileView = UIView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        return profileView
        
    }()
    
    private let userName: UILabel = {
        let userName = UILabel()
        userName.font = .systemFont(ofSize: 18, weight: .bold)
        userName.text = "Lucky Monkey"
        userName.textAlignment = .left
        userName.textColor = .black
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        return userName
    }()
    
    private let changedStatus: UITextField = {
        let changedStatus = UITextField()
        changedStatus.layer.borderWidth = 1
        changedStatus.layer.borderColor = UIColor.black.cgColor
        changedStatus.backgroundColor = .white
        changedStatus.layer.cornerRadius = 12
        changedStatus.addTarget(self, action: #selector(statusChanged), for: .editingChanged)
        changedStatus.translatesAutoresizingMaskIntoConstraints = false
        
        return changedStatus
    }()
    
    private let status: UILabel = {
        let status = UILabel()
        status.font = .systemFont(ofSize: 14)
        status.text = "Can't stop coding..."
        status.textColor = .gray
        status.textAlignment = .left
        status.translatesAutoresizingMaskIntoConstraints = false
        
        return status
    }()
    
    let setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.4
        setStatusButton.layer.cornerRadius = 8
        setStatusButton.clipsToBounds = false
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.setTitle("Update status", for: .normal)
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        return setStatusButton
    }()
    
    private let avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.image = UIImage.init(named: "avatar_1")
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        return avatarImage
    }()
    
    @objc private func statusChanged() {
        statusText = changedStatus.text ?? "  "
    }
    
    @objc private func buttonPressed() {
        status.text = statusText
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.clipsToBounds = true
    }
    
    fileprivate func setupViews() {
        contentView.addSubview(userName)
        contentView.addSubview(changedStatus)
        contentView.addSubview(status)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(avatarImage)
        
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            userName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
            userName.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 10),
            status.leadingAnchor.constraint(equalTo: userName.leadingAnchor),
            status.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 6),
            changedStatus.leadingAnchor.constraint(equalTo: status.leadingAnchor),
            changedStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            changedStatus.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor),
            changedStatus.heightAnchor.constraint(equalToConstant: 40),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20)
        ])
    }
}
