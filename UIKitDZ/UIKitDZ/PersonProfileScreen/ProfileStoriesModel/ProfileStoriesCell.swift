// ProfileStoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для историй профиля
final class ProfileStoriesCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let xOffset = 15
        static let increaseXOffset = 70
        static let circleImageName = "circle"
        static let fontVerdana = "Verdana"
    }

    // MARK: - Visual Components

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }

    // MARK: - Public Methods

    public func configure(with items: [ProfileStories]) {
        var xOffset = CGFloat(Constants.xOffset)

        for item in items {
            let circleImageView = UIImageView()
            circleImageView.image = UIImage(named: Constants.circleImageName)
            circleImageView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(circleImageView)

            circleImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: xOffset)
                .isActive = true
            circleImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 15).isActive = true

            let imageView = UIImageView()
            imageView.image = UIImage(named: item.imageName)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 49).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 49).isActive = true
            imageView.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor).isActive = true

            xOffset += CGFloat(Constants.increaseXOffset)

            let label = UILabel()
            label.text = item.name
            label.textAlignment = .center
            label.font = UIFont(name: Constants.fontVerdana, size: 8)
            scrollView.addSubview(label)

            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
            label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        }

        scrollView.contentSize = CGSize(width: xOffset, height: 100)
    }

    // MARK: - Private Methods

    private func setupView() {
        contentView.addSubview(scrollView)
    }

    private func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
