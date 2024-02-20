// PostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class PostCell: UITableViewCell {
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        label.textColor = .black
        return label
    }()

    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "shareButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let imageViewController: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let hearthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hearth"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let telegramButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "telegram"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "save"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Verdana-Bold", size: 10)
        return label
    }()

    let comentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 10)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageComment: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mainUserImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Комментировать ..."
        textField.font = UIFont(name: "Verdana", size: 10)
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "Verdana", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with items: ModelPost) {
        userImageView.image = items.imageUser
        userNameLabel.text = items.username
        imageViewController.image = items.postImage
        likesLabel.text = items.numberLikes
        timeLabel.text = items.time
        let text = items.userComent
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "tur_v_dagestan")
        attributedString.addAttribute(.font, value: UIFont(name: "Verdana-Bold", size: 10) ?? "", range: range)
        comentLabel.attributedText = attributedString
    }

    func addViews() {
        contentView.addSubview(shareButton)
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(imageViewController)
        contentView.addSubview(hearthButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(telegramButton)
        contentView.addSubview(saveButton)
        contentView.addSubview(likesLabel)
        contentView.addSubview(comentLabel)
        contentView.addSubview(imageComment)
        contentView.addSubview(commentTextField)
        contentView.addSubview(timeLabel)
    }

    func setupCell() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true

        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true

        shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
        shareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true

        imageViewController.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10).isActive = true
        imageViewController.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageViewController.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        hearthButton.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 12).isActive = true
        hearthButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true

        commentButton.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 12).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42).isActive = true

        telegramButton.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 12).isActive = true
        telegramButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 77).isActive = true

        saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
        saveButton.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 11).isActive = true

        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        likesLabel.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 40).isActive = true

        comentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        comentLabel.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 60).isActive = true
        comentLabel.widthAnchor.constraint(equalToConstant: 355).isActive = true

        imageComment.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        imageComment.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 94).isActive = true
        imageComment.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageComment.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        commentTextField.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 98).isActive = true
        commentTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true

        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        timeLabel.topAnchor.constraint(equalTo: imageViewController.bottomAnchor, constant: 117).isActive = true
    }
}
