//
//  FeedViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post (title: "First Post")
    
    private lazy var actionButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 12
        button.setTitle("View the post", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var actionButton2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 12
        button.setTitle("View the post", for: .normal)
        button.setTitleColor(.black, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
            
        stackView.addArrangedSubview(self.actionButton1)
        stackView.addArrangedSubview(self.actionButton2)
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
        
        view.addSubview(stackView)
        
        setupContraints()
//        view.addSubview(actionButton)
//
//        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            actionButton.leadingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.leadingAnchor,
//                constant: 30.0
//            ),
//            actionButton.trailingAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.trailingAnchor,
//                constant: -30.0
//            ),
//            actionButton.topAnchor.constraint(
//                equalTo: safeAreaLayoutGuide.topAnchor,
//                constant: 30),
//            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
//        ])
        
        actionButton1.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        actionButton2.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }

    @objc func buttonPressed(_ sender: UIButton) {
        let postViewController = PostViewController()
        
        postViewController.modalTransitionStyle = .coverVertical
        postViewController.modalPresentationStyle = .fullScreen
        postViewController.postTitle = post.title
        
        navigationController?.pushViewController(postViewController, animated: true)
        //present(postViewController, animated: true)
    }
    
    private func setupContraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 10.0
            ),
            stackView.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: -10.0
            ),
            stackView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor
            ),
            stackView.bottomAnchor.constraint(
                equalTo: safeAreaGuide.bottomAnchor
            ),
        ])
    }
}
