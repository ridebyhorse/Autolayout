//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 26.04.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit
import iOSIntPackage



class PhotosViewController: UIViewController, ImageLibrarySubscriber {

    private var filteredImages: [UIImage] = []
    
    let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let facade = ImagePublisherFacade()
    
 

    
    private(set) var observations: [NSKeyValueObservation] = []
    
    var newImages = [UIImage]()
    
    func receive(images: [UIImage]) {
        newImages = images
        collectionView.reloadData()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        facade.subscribe(self)
        
        view.backgroundColor = .white
        
        setupViews()
        
        
            
//            self.facade.addImagesWithTimer(time: 1.5, repeat: 20, userImages: filteredImages)
        
        
//    completion: [CGImage(photos)])
        
        facade.addImagesWithTimer(time: 1.5, repeat: 20, userImages: filteredImages)
        
        
    }
    
    func sendImages(input: [UIImage]) -> Void {
        self.filteredImages = input
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        facade.removeSubscription(for: self)
        facade.rechargeImageLibrary()
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier
        )
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return newImages.count
    
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        photoCell.photoImageView.image = newImages[indexPath.row]
        

        return photoCell
        
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        
        let finalWidth = width - (spacing * 2)
        
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = view.frame.width - 36
        
        let width = size / 3
        
        return CGSize(width: width, height: width)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(
                top: 8,
                left: 8,
                bottom: 8,
                right: 8
        )
        
    }
    
    
    
}
