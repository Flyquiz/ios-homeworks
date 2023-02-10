//
//  PostViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class PostViewController: UIViewController {

    var titleForPost: String = "null"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = titleForPost
        setupBarButton()
    }

    private func setupBarButton() {
        let barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barButtonAction))
        navigationItem.rightBarButtonItem = barButton
    }

    @objc private func barButtonAction() {
        let infoViewController = InfoViewController()
        infoViewController.title = "Info"
        present(infoViewController, animated: true)
    }
}
