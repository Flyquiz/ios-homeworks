//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let headerView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(headerView)
        headerView.frame = view.frame
    }
}
