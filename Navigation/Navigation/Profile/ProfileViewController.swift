//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let postModel = PostStorage.makeMockModel()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        mainTableView.reloadData()
    }
    
    private func setupLayout() {
        view.addSubview(mainTableView)
        mainTableView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}



extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return postModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let photosCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier) as! PhotosTableViewCell
            return photosCell
        default:
            let tableCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier) as! PostTableViewCell
            tableCell.setupCell(model: postModel[indexPath.row])
            return tableCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}


extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = ProfileHeaderView()
            header.backgroundColor = mainTableView.backgroundColor
            return header
        default:
            return nil
        }
    }
//TODO: Заглушка для высоты ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        default:
            return UITableView.automaticDimension
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        default:
            let detailVC = PostDetailViewController()
            detailVC.setupVC(model: postModel[indexPath.row])
            present(detailVC, animated: true)
            postModel[indexPath.row].views += 1
            tableView.reloadData()
        }
    }
}


extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
