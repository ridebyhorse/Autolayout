//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Мария Можаева on 22.04.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(systemName: "arrow.forward")
        arrow.contentMode = .scaleAspectFit
        arrow.clipsToBounds = true
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    private let photo1ImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "0")
        imageView.image = photos[0]
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photo2ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = photos[1]
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photo3ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = photos[2]
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photo4ImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = photos[3]
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupViews() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrow)
        contentView.addSubview(photo1ImageView)
        contentView.addSubview(photo2ImageView)
        contentView.addSubview(photo3ImageView)
        contentView.addSubview(photo4ImageView)
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            arrow.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrow.widthAnchor.constraint(equalToConstant: 25),
            arrow.heightAnchor.constraint(equalTo: arrow.widthAnchor),
            photo1ImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photo1ImageView.leadingAnchor.constraint(equalTo: photosLabel.leadingAnchor),
            photo1ImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 8 * 3 - 12 * 2 / 4),
            photo1ImageView.heightAnchor.constraint(equalTo: photo1ImageView.widthAnchor, multiplier: 0.75),
            photo1ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photo2ImageView.topAnchor.constraint(equalTo: photo1ImageView.topAnchor),
            photo2ImageView.leadingAnchor.constraint(equalTo: photo1ImageView.trailingAnchor, constant: 8),
            photo2ImageView.widthAnchor.constraint(equalTo: photo1ImageView.widthAnchor),
            photo2ImageView.heightAnchor.constraint(equalTo: photo1ImageView.heightAnchor),
            photo2ImageView.bottomAnchor.constraint(equalTo: photo1ImageView.bottomAnchor),
            photo3ImageView.topAnchor.constraint(equalTo: photo2ImageView.topAnchor),
            photo3ImageView.leadingAnchor.constraint(equalTo: photo2ImageView.trailingAnchor, constant: 8),
            photo3ImageView.widthAnchor.constraint(equalTo: photo2ImageView.widthAnchor),
            photo3ImageView.heightAnchor.constraint(equalTo: photo2ImageView.heightAnchor),
            photo3ImageView.bottomAnchor.constraint(equalTo: photo2ImageView.bottomAnchor),
            photo4ImageView.topAnchor.constraint(equalTo: photo3ImageView.topAnchor),
            photo4ImageView.leadingAnchor.constraint(equalTo: photo3ImageView.trailingAnchor, constant: 8),
            photo4ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photo4ImageView.widthAnchor.constraint(equalTo: photo3ImageView.widthAnchor),
            photo4ImageView.heightAnchor.constraint(equalTo: photo3ImageView.heightAnchor),
            photo4ImageView.bottomAnchor.constraint(equalTo: photo3ImageView.bottomAnchor)
        ])
    }
    
    
}
