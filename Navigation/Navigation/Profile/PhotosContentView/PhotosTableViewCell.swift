//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Иван Захаров on 24.05.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    private let photosModel = Photos.makeMockModel()
    
    private lazy var tablePhotosCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
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
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
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
    
    
//    @objc func navigationButtonAction() {
//        TODO: Меняем когда появится VC
//        let vc = LogInViewController()
//        UINavigationController.pushViewController(vc, animated: true)
//            }
    
    private func setupLayout() {
        [tablePhotosCollectionView, photosLabel, navigationButton].forEach {
            contentView.addSubview($0)
        }

        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            navigationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            navigationButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            
            tablePhotosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
            tablePhotosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tablePhotosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tablePhotosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}


extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: photosModel[indexPath.item])
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
//MARK: Размеры картинок
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wigth = (collectionView.bounds.width - 8 * 3 - 2 * 12) / 4
        return CGSize(width: wigth, height: wigth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    
}


//TODO: Ячейка из tabbleview нормально кастит свой размер. Проблема в том что этот размер задается ДО развертывания contentView
