//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Иван Захаров on 24.05.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    private let model = Photos.makeMockModel()
    
    private lazy var tablePhotosCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let navigationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "arrow.right"), for: .normal)
//        button.addTarget(self, action: #selector(navigationButtonAction), for: .touchUpInside)
        return button
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        [tablePhotosCollectionView, photosLabel, navigationButton].forEach {
            contentView.addSubview($0)
        }
        //TODO: Возможно лейаут опять мертворожденный. Нужно попробовать задать отступы через делегат скроллвью
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            navigationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12),
            navigationButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            
            tablePhotosCollectionView.topAnchor.constraint(equalTo: photosLabel.topAnchor),
            tablePhotosCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tablePhotosCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tablePhotosCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
     return UICollectionViewCell()
    }
}

extension PhotosTableViewCell: UICollectionViewDelegate {
    
}
