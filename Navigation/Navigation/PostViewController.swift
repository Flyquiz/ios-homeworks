//
//  PostViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPostView()
    }

    private func setupPostView() {
        view.backgroundColor = .systemPink
        navigationItem.title = "Post"
    }
}
