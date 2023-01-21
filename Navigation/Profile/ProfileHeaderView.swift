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
//let offset3: CGFloat = 34

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

    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private lazy var statusField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var statusText: String = "Nice place for some quote"
    
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
        
        statusLabel.text = statusText
        statusLabel.textColor = .gray
        statusLabel.font = UIFont(name: "System", size: 14)
        
        statusField.text = statusText
        statusField.layer.borderWidth = 1
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.backgroundColor = .white
        statusField.font = UIFont(name: "System", size: 15)
        statusField.textColor = .black
        statusField.layer.cornerRadius = 12
        statusField.clipsToBounds = true
        statusField.leftView = UIView (frame: CGRect(x: 0, y: 0, width: 10, height: statusField.frame.height))
        statusField.leftViewMode = .always
        
        actionButton.backgroundColor = .systemBlue
        actionButton.layer.cornerRadius = 4
        actionButton.setTitle("Set status", for: .normal)
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        actionButton.layer.shadowRadius = 4
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.layer.shadowOpacity = 0.7
        
        addSubview(image)
        addSubview(profileName)
        addSubview(statusLabel)
        addSubview(actionButton)
        addSubview(statusField)
        
        let safeAreaGuide = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: offset1),
            image.heightAnchor.constraint(equalToConstant: imgSize),
            image.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: offset1),
            image.widthAnchor.constraint(equalToConstant: imgSize),
            
            profileName.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: offset2),
            profileName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: offset1),
            profileName.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            
            statusLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: offset1),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            statusLabel.bottomAnchor.constraint(equalTo: statusField.topAnchor, constant: -offset1),
            
            statusField.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -offset1),
            statusField.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: offset1),
            statusField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            statusField.heightAnchor.constraint(equalToConstant: 40),
            
            actionButton.topAnchor.constraint(equalTo: image.bottomAnchor, constant: offset1),
            actionButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: offset1),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -offset1),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        statusField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ sender: UITextField) {
        statusText = statusField.text ?? ""
    }
}
