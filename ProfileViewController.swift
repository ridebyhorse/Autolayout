//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 01.06.2021.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageServices

class ProfileViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    let publicationCellID = "PublicationCellID"
    
    let photosCellID = "PhotosCellID"
    
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
        
        applyFilters()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
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
        
        if section == 0 {
            return headerView
        } else {
            return nil
        }
        
    }
    
}
