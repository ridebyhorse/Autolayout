//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 01.06.2021.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageServices
import iOSIntPackage

class ProfileViewController: UIViewController {
    
    private let imageProcessor = ImageProcessor()
  
    private var filteredImages: [UIImage] = []

    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    let publicationCellID = "PublicationCellID"
    
    let photosCellID = "PhotosCellID"
    
    var user: User
    
    
    init(currentUser: CurrentUserService, inputName: String) {
        
        user = currentUser.provideUserData(inputName)
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    init(testUser: TestUserService, inputName: String) {
        
        user = testUser.provideUserData(inputName)
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        view.addSubview(tableView)
#if DEBUG
        tableView.backgroundColor = .white
#else
        tableView.backgroundColor = .lightGray
#endif
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        

        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: publicationCellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellID)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
        
//        applyFilters()
        let startTime = Date()
        
/*
Filtering images from "photos" array with "colorInvert" filter and background quality of service finished in 3.8 seconds.
 */
        
//        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .colorInvert, qos: .background) { result in
//
//            self.getFilteredImages(input: result, startTime: startTime)
//
//        }
        
/*
Filtering images from "photos" array with "colorInvert" filter and utility quality of service finished in 1.7 seconds.
*/
        
//        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .colorInvert, qos: .utility) { result in
//
//            self.getFilteredImages(input: result, startTime: startTime)
//
//        }
        
        
/*
Filtering images from "photos" array with "chrome" filter and default quality of service finished in 1.5 seconds.
*/

//        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .chrome, qos: .default) { result in
//
//            self.getFilteredImages(input: result, startTime: startTime)
//        }
        
        
/*
Filtering images from "photos" array with "bloom" filter and default quality of service finished in 1.4 seconds.
*/
        
//        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .bloom(intensity: 50), qos: .default) { result in
//
//            self.getFilteredImages(input: result, startTime: startTime)
//        }
//
        
/*
Filtering images from "photos" array with "sepia" filter and userInitiated quality of service finished in 1.3 seconds.
*/
        
//        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .sepia(intensity: 3), qos: .userInitiated) { result in
//
//            self.getFilteredImages(input: result, startTime: startTime)
//        }
        
        
/*
Filtering images from "photos" array with "noir" filter and userInitiated quality of service finished in 1.5 seconds.
*/
        
//        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .noir, qos: .userInitiated) { result in
//
//            self.getFilteredImages(input: result, startTime: startTime)
//        }
        
        
/*
Filtering images from "photos" array with "crystallize" filter and userInteractive quality of service finished in 1.3 seconds.
*/
        
        imageProcessor.processImagesOnThread(sourceImages: photos, filter: .crystallize(radius: 20), qos: .userInteractive) { (result) -> () in

            self.getFilteredImages(input: result, startTime: startTime)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func getFilteredImages(input: [CGImage?], startTime: Date) {
        for i in 0..<input.count {
            if let res = input[i]{
            self.filteredImages.append(UIImage(cgImage: res))
            }
        }
    let endTime = Date()
    let timeElapsed = endTime.timeIntervalSince(startTime)

        print("Filtered \(self.filteredImages.count) images with \(timeElapsed) s.")
    }
    
}

extension ProfileViewController: UITableViewDelegate {
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 200
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
            photosVC.sendImages(input: filteredImages)
            photosVC.navigationItem.title = "Photo Gallery"
        } else {
            return
        }
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return publications.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let publicationCell: FeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: publicationCellID, for: indexPath) as! FeedTableViewCell
        
        let photosCell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: photosCellID, for: indexPath) as! PhotosTableViewCell
        
        publicationCell.publication = publications[indexPath.row]
        
        if indexPath.section == 0 {
            return photosCell
        } else {
            return publicationCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView =
                tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderView.self)) as?
                ProfileHeaderView else{ return nil }
        headerView.userName.text = user.name
        headerView.avatarImage.image = user.avatar
        headerView.status.text = user.status
        
        if section == 0 {
            return headerView
        } else {
            return nil
        }
        
    }
    
}
