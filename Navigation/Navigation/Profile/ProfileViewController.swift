//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let headerView = ProfileHeaderView()

    private let bottomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Title", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(headerView)
        view.addSubview(bottomButton)
        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            headerView.heightAnchor.constraint(equalToConstant: 220),

            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bottomButton.heightAnchor.constraint(equalToConstant: bottomButton.intrinsicContentSize.height)
        ])
    }
}
