//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Иван Захаров on 28.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {

    private var statusText: String = "Old status"

    private lazy var statusTextField: UITextField = {
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
        textField.delegate = self
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

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var statusButton: UIButton = {
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


    override init(frame: CGRect) {
        super.init(frame: .zero)
        statusLabel.text = statusText
        setupLayout()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    @objc func statusButtonAction() {
        statusLabel.text = statusText
        statusTextField.text = nil
        statusTextField.endEditing(true)
    }

    @objc func textFieldAction(_ textField: UITextField) {
        statusText = textField.text!
    }

    private func setupLayout() {
        [avatarImageView, fullNameLabel, statusLabel, statusButton, statusTextField].forEach {
            addSubview($0)
        }
        
            NSLayoutConstraint.activate([
                avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                avatarImageView.heightAnchor.constraint(equalToConstant: 100),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),

                fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                fullNameLabel.heightAnchor.constraint(equalToConstant: 20),
                fullNameLabel.widthAnchor.constraint(equalToConstant: 200),

                statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -54),
                statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                statusLabel.heightAnchor.constraint(equalToConstant: 15),
                statusLabel.widthAnchor.constraint(equalToConstant: 200),

                statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
                statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusButton.heightAnchor.constraint(equalToConstant: 50),
                statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

                statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -7),
                statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
                statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}



extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusText = textField.text!
        statusButtonAction()
        return true
    }
}
