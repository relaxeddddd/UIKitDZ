// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

//
//  StoriesCell.swift
//  UIKitDZ
//
//  Created by mac on 19.02.2024.
//
import UIKit

// Класс создания ячейки
final class StoriesCell: UITableViewCell {
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    func configure(with items: [ModelStories]) {
        var xOffset: CGFloat = 15

        for item in items {
            let imageView = UIImageView(image: item.image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: xOffset).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true

            xOffset += 80

            let label = UILabel()
            label.text = item.name
            label.textAlignment = .center
            label.font = UIFont(name: "Verdana", size: 8)
            scrollView.addSubview(label)

            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
            label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
            if item.addButton == true {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.layer.cornerRadius = 10
                button.clipsToBounds = true
                button.setImage(UIImage(systemName: "plus"), for: .normal)
                button.tintColor = .white
                button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
                scrollView.addSubview(button)

                button.heightAnchor.constraint(equalToConstant: 20).isActive = true
                button.widthAnchor.constraint(equalToConstant: 20).isActive = true
                button.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -18)
                    .isActive = true
                button.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            }
        }

        scrollView.contentSize = CGSize(width: xOffset, height: 100)
    }
}
