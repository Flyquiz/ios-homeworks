//
//  FeedViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 09.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupButton()
    }

    private func setupButton() {
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
    }

    @objc private func pressAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }

}
