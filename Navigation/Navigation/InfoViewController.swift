//
//  InfoViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 10.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private var infoButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupInfoButton()
    }

    private func setupInfoButton() {
        view.addSubview(infoButton)
        infoButton.setTitle("Info", for: .normal)
        infoButton.backgroundColor = .black
        infoButton.center = view.center
        infoButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc private func buttonAction() {
        let alert = UIAlertController(title: "Alert title", message: "Alert message", preferredStyle: .alert)
        let alert1 = UIAlertAction(title: "1", style: .default) { _ in
            print("AlertAction1")
        }
        let alert2 = UIAlertAction(title: "2", style: .default) { _ in
            print("AlertAction2")
        }
        alert.addAction(alert1)
        alert.addAction(alert2)
        present(alert, animated: true)
    }
}
