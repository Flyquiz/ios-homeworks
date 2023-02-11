//
//  FeedViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private var post = Post(title: "Пост")
    private let postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupPostButton()
    }
    private func setupPostButton() {
        view.addSubview(postButton)
        postButton.setTitle(post.title, for: .normal)
        postButton.setTitleColor(.systemBlue, for: .normal)
        postButton.backgroundColor = .systemGray5
        postButton.center = view.center
        postButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc private func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titleForPost = post.title
    }

}
