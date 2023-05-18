//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Иван Захаров on 18.05.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()

    private func layout() {
        [authorLabel, descriptionLabel, image, likesLabel, viewsLabel].forEach {
            contentView.addSubview($0)
        }
        contentView.backgroundColor = .white
        
        let screenWidth = UIScreen.main.bounds.width
        NSLayoutConstraint.activate([
            //TODO: Отступ от leading?
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: authorLabel.intrinsicContentSize.height),

            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: screenWidth),
            image.widthAnchor.constraint(equalToConstant: screenWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabel.intrinsicContentSize.height),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.heightAnchor.constraint(equalToConstant: likesLabel.intrinsicContentSize.height),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            viewsLabel.heightAnchor.constraint(equalToConstant: viewsLabel.intrinsicContentSize.height),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
