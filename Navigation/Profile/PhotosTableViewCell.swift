//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 04.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    // MARK: - Subviews
    
    private lazy var photoesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.forward")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var photo1ImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo1")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var photo2ImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo2")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var photo3ImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo3")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var photo4ImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "photo4")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var photoesStackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
            
        stackView.addArrangedSubview(self.photo1ImageView)
        stackView.addArrangedSubview(self.photo2ImageView)
        stackView.addArrangedSubview(self.photo3ImageView)
        stackView.addArrangedSubview(self.photo4ImageView)
        
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )

        tuneView()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func tuneView() {
        contentView.backgroundColor = .systemBackground
        accessoryType = .none
    }
    
    private func addSubviews() {
        contentView.addSubview(photoesLabel)
        contentView.addSubview(photoesStackView)
        contentView.addSubview(arrowImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            photoesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowImageView.centerYAnchor.constraint(equalTo: photoesLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photoesStackView.topAnchor.constraint(equalTo: photoesLabel.bottomAnchor, constant: 12),
            photoesStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoesStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoesStackView.heightAnchor.constraint(equalToConstant: (contentView.frame.width)/4 ),
            photoesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

}
