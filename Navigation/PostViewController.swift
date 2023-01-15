//
//  PostViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var postTitle: String = "The Post"

    private lazy var actionButton: UIButton = {

        let button = UIButton()
        
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 12
        button.setTitle("Return", for: .normal)
        button.setTitleColor(.systemYellow, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
        title = postTitle
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = barButton
        
        view.addSubview(actionButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 30.0
            ),
            actionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -30.0
            ),
            actionButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 30),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func openInfo() {
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .crossDissolve
        infoViewController.modalPresentationStyle = .currentContext
        
        present(infoViewController, animated: true)
    }
}
