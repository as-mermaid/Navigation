//
//  FeedViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post (title: "First Post")
    
    private lazy var actionButton: UIButton = {

        let button = UIButton()
        
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 12
        button.setTitle("View the post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
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
        let postViewController = PostViewController()
        
        postViewController.modalTransitionStyle = .coverVertical
        postViewController.modalPresentationStyle = .fullScreen
        postViewController.postTitle = post.title
        
        navigationController?.pushViewController(postViewController, animated: true)
        //present(postViewController, animated: true)
    }
}
