//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Иван Захаров on 31.05.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    private let photosModel = Photos.makeMockModel()
    
    private let photoCell = PhotosTableViewCell()
    
    private var initialImageRect: CGRect = .zero
    
    private let statusBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var animatingImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let dimmedView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()
    
    private lazy var returnAnimationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "x.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.tintColor = .white
        button.alpha = 0.0
        button.addTarget(self, action: #selector(returnButtonAction), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
        setupLayout()
    }

    
    private func setupLayout() {
        view.addSubview(photosCollectionView)
        view.addSubview(statusBarView)
        
        statusBarView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(dimmedView)
        view.addSubview(animatingImageView)
        view.addSubview(returnAnimationButton)
        
        returnAnimationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        returnAnimationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        animatingImageView.image = image
        animatingImageView.frame = CGRect(x: imageFrame.origin.x, y: imageFrame.origin.y, width: imageFrame.width, height: imageFrame.height)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut) { [self] in
            animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            animatingImageView.center = view.center
            
            dimmedView.alpha = 0.9
            
            navigationController?.navigationBar.alpha = 0.1
            navigationController?.navigationBar.isUserInteractionEnabled = false
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [self] in
                returnAnimationButton.alpha = 1.0
            }
        }
    }
    @objc func returnButtonAction() {
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.0) { [self] in
            animatingImageView.frame = initialImageRect
            dimmedView.alpha = 0
            returnAnimationButton.alpha = 0.0
            
            navigationController?.navigationBar.alpha = 1.0
            navigationController?.navigationBar.isUserInteractionEnabled = true
        } completion: { [self] _ in
            animatingImageView.removeFromSuperview()
            dimmedView.removeFromSuperview()
            returnAnimationButton.removeFromSuperview()
        }
    }
}



extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photosModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(model: photosModel[indexPath.item], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}


extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
}


extension PhotosViewController: CollectionViewCellDelegate {
    func didTapImage(_ image: UIImage?, imageRect: CGRect, indexPath: IndexPath) {
        let cellLayoutAttributes = photosCollectionView.layoutAttributesForItem(at: indexPath)
        let currentCellRect = photosCollectionView.convert(cellLayoutAttributes!.frame, to: view)
        initialImageRect = CGRect(x: imageRect.origin.x + currentCellRect.origin.x, y: imageRect.origin.y + currentCellRect.origin.y, width: imageRect.width, height: imageRect.height)
        
        animateImage(image, imageFrame: initialImageRect)
    }
}
