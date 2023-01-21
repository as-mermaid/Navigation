//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 19.01.2023.
//

import UIKit

let imgSize: CGFloat = 150
let offset1: CGFloat = 16
let offset2: CGFloat = 27
let offset3: CGFloat = 34

class ProfileHeaderView: UIView {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var profileName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var statusText: UITextField = {
        let status = UITextField()
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        
        image.frame.size.width = imgSize
        image.image = UIImage(named: "ProfileImage")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        
        profileName.text = "Mermaid"
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        profileName.textColor = .black
        
        statusText.text = "Nice place for some quote"
        statusText.textColor = .gray
        statusText.font = UIFont(name: "System", size: 14)
        
        actionButton.backgroundColor = .systemBlue
        actionButton.layer.cornerRadius = 4
        actionButton.setTitle("Show status", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        actionButton.layer.shadowRadius = 4
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.layer.shadowOpacity = 0.7
        
        
        addSubview(image)
        addSubview(profileName)
        addSubview(statusText)
        addSubview(actionButton)
        
        let safeAreaGuide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: offset1),
            image.heightAnchor.constraint(equalToConstant: imgSize),
            image.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: offset1),
            image.widthAnchor.constraint(equalToConstant: imgSize),
            
            profileName.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: offset2),
            profileName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: offset1),
            profileName.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            
            statusText.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: offset1),
            statusText.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            statusText.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -offset3),
            
            actionButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: offset1),
            actionButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: offset1),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        print (statusText.text ?? "Empty status")
    }
}
