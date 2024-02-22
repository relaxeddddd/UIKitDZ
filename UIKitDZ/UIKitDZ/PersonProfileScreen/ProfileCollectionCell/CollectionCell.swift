// CollectionCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка постов профиля
class CollectionCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let CollectionCellCellIdentifire = "CollectionCell"
        static let spacing = 0
    }
    // MARK: - Private Properties
    private let images = ["rocket2", "rocket", "rocket3", "rocket4", "rocket3", "rocket2", "rocket2", "rocket", "rocket3"]

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }

    // MARK: - Private Mothods
    private func setupCollectionView() {
        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let spacing: CGFloat = CGFloat(Constants.spacing)
            let itemSize = UIScreen.main.bounds.width / 3
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            layout.itemSize = CGSize(width: itemSize, height: itemSize)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(
                UICollectionViewCell.self,
                forCellWithReuseIdentifier: Constants.CollectionCellCellIdentifire
            )
            return collectionView
        }()
        addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - CollectionCell + UICollectionViewDelegate

extension CollectionCell: UICollectionViewDelegate {}

// MARK: - CollectionCell + UICollectionViewDataSource

extension CollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.CollectionCellCellIdentifire,
            for: indexPath
        )
        let imageView = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: cell.frame.width,
            height: cell.frame.height
        ))
        imageView.image = UIImage(named: images[indexPath.item])
        cell.contentView.addSubview(imageView)
        return cell
    }
}
