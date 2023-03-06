//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Иван Захаров on 28.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "letov")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Егор Летов"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    private let profileStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My status"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    //TODO: unfinished
    private let statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        
        return button
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(profileImage)
        addSubview(profileLabel)
        addSubview(profileStatus)
        addSubview(statusButton)
        layout()
    }

    private func layout() {
        func toProfileImage() {
            NSLayoutConstraint.activate([
                profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                profileImage.heightAnchor.constraint(equalToConstant: 100),
                profileImage.widthAnchor.constraint(equalToConstant: 100)
            ])
        }
        func toProfileLabel() {
            NSLayoutConstraint.activate([
                profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
                profileLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                profileLabel.heightAnchor.constraint(equalToConstant: 20),
                profileLabel.widthAnchor.constraint(equalToConstant: 200)
            ])
        }
        func toProfileStatus() {
            NSLayoutConstraint.activate([
                profileStatus.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
                profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                profileStatus.heightAnchor.constraint(equalToConstant: 15),
                profileStatus.widthAnchor.constraint(equalToConstant: 200)
            ])
        }
        func toStatusButton() {
            NSLayoutConstraint.activate([
                statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
                statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        toProfileImage()
        toProfileLabel()
        toProfileStatus()
        toStatusButton()
    }
}
