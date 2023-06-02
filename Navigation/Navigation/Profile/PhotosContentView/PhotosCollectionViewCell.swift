//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Иван Захаров on 24.05.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
    }
    
    public func setupCell(model: Photos) {
        cellImageView.image = model.image
    }
    
    public func changeImageCornerRadius() {
        cellImageView.layer.cornerRadius = 6
    }
 
    private func setupLayout() {
        contentView.addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
