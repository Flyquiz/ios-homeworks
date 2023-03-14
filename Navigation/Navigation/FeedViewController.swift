//
//  FeedViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private var post = Post(title: "Пост")

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let toPostButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()

    private let toPostButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupLayout()
        setupButtons()
    }

    private func setupButtons() {
        toPostButton1.setTitle(post.title, for: .normal)
        toPostButton2.setTitle(post.title, for: .normal)
        toPostButton1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        toPostButton2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc private func buttonAction() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
        postVC.titleForPost = post.title
    }

    private func setupLayout() {
        view.addSubview(stackView)

        stackView.axis = .vertical
        stackView.addArrangedSubview(toPostButton1)
        stackView.addArrangedSubview(toPostButton2)
        stackView.spacing = 10

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            toPostButton1.heightAnchor.constraint(equalToConstant: 50),
            toPostButton1.widthAnchor.constraint(equalToConstant: 100),
            toPostButton2.heightAnchor.constraint(equalToConstant: 50),
            toPostButton2.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
