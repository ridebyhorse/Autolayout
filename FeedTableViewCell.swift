//
//  TableViewCell.swift
//  Navigation
//
//  Created by Мария Можаева on 04.07.2021.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageServices

class FeedTableViewCell: UITableViewCell {
    
    var publication: PostExample? {
        didSet {
            publicationImageView.image = publication?.image
            publicationAuthor.text = publication?.author
            publicationDescription.text = publication?.description
            publicationLikes.text = "Likes: \(publication?.likes ?? 0)"
            publicationViews.text = "Views: \(publication?.views ?? 0)"
        }
    }
    
    private let publicationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let publicationAuthor: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let publicationDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let publicationLikes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let publicationViews: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(publicationImageView)
        contentView.addSubview(publicationAuthor)
        contentView.addSubview(publicationDescription)
        contentView.addSubview(publicationViews)
        contentView.addSubview(publicationLikes)
        
        NSLayoutConstraint.activate([
            publicationAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            publicationAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            publicationAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            publicationImageView.topAnchor.constraint(equalTo: publicationAuthor.bottomAnchor, constant: 12),
            publicationImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            publicationImageView.heightAnchor.constraint(equalTo: publicationImageView.widthAnchor),
            publicationDescription.topAnchor.constraint(equalTo: publicationImageView.bottomAnchor, constant: 16),
            publicationDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            publicationDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            publicationLikes.topAnchor.constraint(equalTo: publicationDescription.bottomAnchor, constant: 16),
            publicationLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            publicationLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            publicationViews.topAnchor.constraint(equalTo: publicationDescription.bottomAnchor, constant: 16),
            publicationViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            publicationViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    
}
