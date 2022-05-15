//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Мария Можаева on 12.01.2022.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private var statusText: String?
    
    var userName: UILabel = {
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
    
    var status: UILabel = {
        let status = UILabel()
        status.font = .systemFont(ofSize: 14)
        status.text = "Can't stop coding"
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
    
    var avatarImage: UIImageView = {
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
        
        avatarImage.snp.makeConstraints {
            $0.leading.top.equalTo(contentView).offset(16)
            $0.height.width.equalTo(100)
        }
        
        userName.snp.makeConstraints {
            $0.leading.equalTo(avatarImage.snp.trailing).offset(20)
            $0.top.equalTo(avatarImage).offset(10)
        }
        
        status.snp.makeConstraints {
            $0.leading.equalTo(userName)
            $0.top.equalTo(userName.snp.bottom).offset(6)
        }
        
        changedStatus.snp.makeConstraints {
            $0.leading.equalTo(status)
            $0.trailing.equalTo(contentView).offset(-16)
            $0.bottom.equalTo(avatarImage)
            $0.height.equalTo(40)
        }
        
        setStatusButton.snp.makeConstraints {
            $0.leading.equalTo(contentView).offset(16)
            $0.trailing.equalTo(contentView).offset(-16)
            $0.top.equalTo(avatarImage.snp.bottom).offset(20)
        }
    }
}
