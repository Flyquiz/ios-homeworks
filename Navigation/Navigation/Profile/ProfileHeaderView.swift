//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Иван Захаров on 28.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {

    private var statusText: String = "Old status"

    private let statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Enter new status here"
        textField.textAlignment = .center
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 6
        textField.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
        return textField
    }()
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
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
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
        button.addTarget(self, action: #selector(statusButtonAction), for: .touchUpInside)
        return button
    }()

    init() {
        profileStatus.text = statusText
        super.init(frame: .zero)
        setupLayout()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func statusButtonAction() {
        profileStatus.text = statusText
        statusTextField.text = nil
        statusTextField.endEditing(true)
    }
    @objc func textFieldAction(_ textField: UITextField) {
        statusText = textField.text!
    }

    private func setupLayout() {
        addSubview(profileImage)
        addSubview(profileLabel)
        addSubview(profileStatus)
        addSubview(statusButton)
        addSubview(statusTextField)

            NSLayoutConstraint.activate([
                profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                profileImage.heightAnchor.constraint(equalToConstant: 100),
                profileImage.widthAnchor.constraint(equalToConstant: 100)
            ])

            NSLayoutConstraint.activate([
                profileLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
                profileLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                profileLabel.heightAnchor.constraint(equalToConstant: 20),
                profileLabel.widthAnchor.constraint(equalToConstant: 200)
            ])

            NSLayoutConstraint.activate([
                profileStatus.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),
                profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                profileStatus.heightAnchor.constraint(equalToConstant: 15),
                profileStatus.widthAnchor.constraint(equalToConstant: 200)
            ])

            NSLayoutConstraint.activate([
                statusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 36),
                statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusButton.heightAnchor.constraint(equalToConstant: 50)
            ])

            NSLayoutConstraint.activate([
                statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -7),
                statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
                statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}
