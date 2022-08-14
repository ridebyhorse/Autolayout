//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Мария Можаева on 26.04.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.image = UIImage()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .lightGray
        
        contentView.addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        
    }


    func setup(with photo: UIImage) {
        
        photoImageView.image = photos.first

    }
    
}

extension PhotosCollectionViewCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
