//
//  FeedPostViewController.swift
//  Navigation
//
//  Created by Мария Можаева on 24.05.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        let infoItem = UIBarButtonItem(image: UIImage(systemName: "info"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(showInfo))
        
        self.navigationItem.rightBarButtonItem = infoItem

    }
    
    @objc func showInfo(sender: UIBarButtonItem!) {
        print("info button pressed")
        let model = Model()
        let infoController  = InfoViewController(model: model)
        present(
                    infoController,
                    animated: true,
                    completion: nil
                )
    }

}
