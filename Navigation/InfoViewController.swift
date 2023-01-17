//
//  InfoViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var infoButton: UIButton = {

        let button = UIButton()
        
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 12
        button.setTitle("Push me!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        view.addSubview(infoButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            infoButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 30.0
            ),
            infoButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -30.0
            ),
            infoButton.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 30),
            infoButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        infoButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
     
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        
        let alertOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertOK)
        
        let alertCancel = UIAlertAction (title: "Cancel", style: .default) { alert in
            print("The alert was canceled")
        }
        alert.addAction(alertCancel)
        
        present(alert, animated: true, completion: nil)
    }

}
