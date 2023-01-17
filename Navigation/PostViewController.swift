//
//  PostViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var postTitle: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
        title = postTitle
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    
    @objc func openInfo() {
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .crossDissolve
        infoViewController.modalPresentationStyle = .currentContext
        
        self.present(infoViewController, animated: true)
    }
}
