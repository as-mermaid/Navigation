//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = ProfileHeaderView()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = view.frame
    }
}
