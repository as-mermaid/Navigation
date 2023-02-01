//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Anastasia Smorodinova on 15.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Data
    
    fileprivate let data = Post.makeFeed()
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private enum CellReuseID: String {
        case post = "PostTableViewCell_ReuseID"
//        case custom = "CustomTableViewCell_ReuseID"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        addSubviews()

        tuneTableView()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(
                at: indexPath,
                animated: animated
            )
        }
    }
    
    
    // MARK: - Private
    
    private func setupView() {
        view.backgroundColor = .lightGray
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setConstraints () {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
    
    private func tuneTableView() {
        tableView.estimatedRowHeight = 44.0
        
        let headerView = ProfileHeaderView()
        tableView.setAndLayout(headerView: headerView)
        tableView.tableFooterView = UIView()
        
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.post.rawValue
        )
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        1
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        data.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.post.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        
        cell.update(data[indexPath.row])
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {}

extension UITableView {
    
    func setAndLayout(headerView: UIView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
