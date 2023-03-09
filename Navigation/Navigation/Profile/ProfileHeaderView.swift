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
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "letov")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 50
        return imageView
    }()
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Егор Летов"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    private let satusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private let setStatusButton: UIButton = {
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
        satusLabel.text = statusText
        super.init(frame: .zero)
        setupLayout()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func statusButtonAction() {
        satusLabel.text = statusText
        statusTextField.text = nil
        statusTextField.endEditing(true)
    }
    @objc func textFieldAction(_ textField: UITextField) {
        statusText = textField.text!
    }

    private func setupLayout() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(satusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)

            NSLayoutConstraint.activate([
                avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                avatarImageView.heightAnchor.constraint(equalToConstant: 100),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),

                fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                fullNameLabel.heightAnchor.constraint(equalToConstant: 20),
                fullNameLabel.widthAnchor.constraint(equalToConstant: 200),

                satusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),
                satusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                satusLabel.heightAnchor.constraint(equalToConstant: 15),
                satusLabel.widthAnchor.constraint(equalToConstant: 200),

                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
                setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50),

                statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -7),
                statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}
