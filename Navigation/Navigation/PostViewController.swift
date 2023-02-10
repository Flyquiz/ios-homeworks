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
    }
}
