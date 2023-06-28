//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Иван Захаров on 18.05.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    private var isAlreadyLiked: Bool = false
    private var isAlreadyViewed: Bool = false
    
    private var cellModel: Post!
    
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
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Likes: "
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Views: "
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupGesture()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorLabel.text = nil
        descriptionLabel.text = nil
        postImageView.image = nil
        likesLabel.text = "Likes: "
        viewsLabel.text = "Views: "
    }

    public func setupCell(model: Post) {
        cellModel = model
        authorLabel.text = model.author
        descriptionLabel.text = model.description
        postImageView.image = UIImage(named: model.image)
        likesLabel.text = (self.likesLabel.text ?? "") + String(model.likes)
        viewsLabel.text = (self.viewsLabel.text ?? "") + String(model.views)
    }
    
    private func setupLayout() {
        [authorLabel, descriptionLabel, postImageView, likesLabel, viewsLabel].forEach {
            contentView.addSubview($0)
        }
        contentView.backgroundColor = .white
        
        let screenWidth = UIScreen.main.bounds.width
        let inset: CGFloat = 16
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),

            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            postImageView.widthAnchor.constraint(equalToConstant: screenWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
        authorLabel.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
        descriptionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    private func setupGesture() {
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(likesLabelAction))
        likesLabel.addGestureRecognizer(likeTapGesture)
    }
    
    @objc private func likesLabelAction() {
        var likes = Int((likesLabel.text?.filter("0123456789".contains))!)!
        if isAlreadyLiked == false {
            likes += 1
            likesLabel.text = "Likes: " + String(likes)
            cellModel.likes = likes
            isAlreadyLiked.toggle()
        } else {
            likes -= 1
            likesLabel.text = "Likes: " + String(likes)
            cellModel.likes = likes
            isAlreadyLiked.toggle()
        }
    }
}
