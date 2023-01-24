//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
      
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push me", for: .normal)
        button.backgroundColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
        view.addSubview(actionButton)
        
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeaderView.frame = view.frame
    }
    
    private func setConstraints () {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 0),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            
            actionButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            actionButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
    }
}
