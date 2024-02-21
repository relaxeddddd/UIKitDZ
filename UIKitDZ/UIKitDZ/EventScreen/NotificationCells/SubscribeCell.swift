// SubscribeCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс для создания ячейки с кнопкой подписаться
class SubscribeCell: UITableViewCell {
    // MARK: - Visual Components

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Verdana", size: 12)
        return label
    }()

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let addSubButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255, alpha: 1.0)
        button.setTitle("Подтвердить", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(with info: ModelSubscribeCell) {
        commentLabel.text = info.userComment
        userImageView.image = info.imageUser
    }

    // MARK: - Private Methods

    private func setupViews() {
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true

        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        commentLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -2).isActive = true

        addSubButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        addSubButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addSubButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        addSubButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    private func addViews() {
        contentView.addSubview(commentLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(addSubButton)
    }
}
