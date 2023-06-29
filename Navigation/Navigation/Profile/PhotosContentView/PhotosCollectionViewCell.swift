//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Иван Захаров on 24.05.2023.
//

import UIKit


protocol CollectionViewCellDelegate: AnyObject {
    func didTapImage(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}


final class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CollectionViewCellDelegate?
    
    var cellIndex: IndexPath!
        
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupGesture()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.image = nil
    }
    
    public func setupCell(model: Photos, indexPath: IndexPath) {
        cellImageView.image = model.image
        cellIndex = indexPath
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
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        cellImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImage(cellImageView.image, imageRect: cellImageView.frame, indexPath: cellIndex)
    }
}
