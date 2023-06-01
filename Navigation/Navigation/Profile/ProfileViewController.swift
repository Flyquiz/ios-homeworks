//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let postModel = Post.makeMockModel()
    
    private let statusBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
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
        view.addSubview(statusBarView)
        
        mainTableView.backgroundColor = .lightGray
        statusBarView.backgroundColor = mainTableView.backgroundColor
        
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            mainTableView.topAnchor.constraint(equalTo: statusBarView.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: DataSource
extension ProfileViewController: UITableViewDataSource {
//MARK: Кол-во ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return postModel.count
        }
    }
//MARK: Добавление ячеек
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
//MARK: Кол-во секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
//MARK: Delegate
extension ProfileViewController: UITableViewDelegate {
//MARK: Хедер
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
        default: break
        }
    }
}

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
}
