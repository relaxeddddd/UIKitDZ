// ProfileInformationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Создание ячейки информации профиля
final class ProfileInformationCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let fontVerdana = "Verdana"
        static let fontVerdanaBold = "Verdana-Bold"
        static let addButtonButtonImageName = "plus"
        static let changeButtomTitle = "Изменить"
        static let shareProfileButtonTitle = "Поделиться профилем"
        static let addPeopleButtonImageName = "addPeople"
        static let publicationsNumLabel = "67"
        static let publicationsLabel = "Публикации"
        static let subscribersNumLabel = "458"
        static let subscribersLabel = "Подписчики"
        static let subscribeNumLabel = "120"
        static let subscribeLabel = "Подписки"
    }

    // MARK: - Public Properties

    @objc var present: (() -> Void)?

    // MARK: - Private Properties

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 13
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: Constants.addButtonButtonImageName), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
        return button
    }()

    private let namePerson: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let jobTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdana, size: 14)
        return label
    }()

    private let link: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: 14)
        label.setTitleColor(UIColor(red: 4 / 255, green: 104 / 255, blue: 181 / 255, alpha: 1.0), for: .normal)
        label.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
        return label
    }()

    private let changeButtom: UIButton = {
        let buttom = UIButton()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setTitle(Constants.changeButtomTitle, for: .normal)
        buttom.setTitleColor(.black, for: .normal)
        buttom.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1.0)
        buttom.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        buttom.layer.cornerRadius = 8
        return buttom
    }()

    private let shareProfileButton: UIButton = {
        let buttom = UIButton()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setTitle(Constants.shareProfileButtonTitle, for: .normal)
        buttom.setTitleColor(.black, for: .normal)
        buttom.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1.0)
        buttom.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        buttom.layer.cornerRadius = 8
        return buttom
    }()

    private let addPeopleButton: UIButton = {
        let buttom = UIButton()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        buttom.setImage(UIImage(named: Constants.addPeopleButtonImageName), for: .normal)
        buttom.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1.0)
        buttom.layer.cornerRadius = 8
        return buttom
    }()

    private let publicationsNumLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.publicationsNumLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
        return label
    }()

    private let publicationsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.publicationsLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    private let subscribersNumLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribersNumLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribersLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    private let subscribeNumLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribeNumLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
        return label
    }()

    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribeLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        return label
    }()

    // MARK: - Initializers

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        makeAnchor()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeAnchor()
    }

    // MARK: - Public Methods

    func configure(with: ProfileInformation) {
        userImageView.image = UIImage(named: with.userImageName)
        namePerson.text = with.namePerson
        jobTitle.text = with.jobTitle
        link.setTitle(with.link, for: .normal)
    }

    // MARK: - Private Methods

    private func setupViews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(addButton)
        contentView.addSubview(namePerson)
        contentView.addSubview(jobTitle)
        contentView.addSubview(link)
        contentView.addSubview(changeButtom)
        contentView.addSubview(shareProfileButton)
        contentView.addSubview(addPeopleButton)
        contentView.addSubview(publicationsLabel)
        contentView.addSubview(publicationsNumLabel)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(subscribersNumLabel)
        contentView.addSubview(subscribeLabel)
        contentView.addSubview(subscribeNumLabel)
    }

    private func makeAnchor() {
        setAnchorUserImageView()
        setAnchorAddButton()
        setAnchorNamePerson()
        setAnchorJobTitle()
        setAnchorLink()
        setAnchorChangeButtom()
        setAnchorShareProfileButton()
        setupAnchorAddPeopleButton()
        setupAnchorPublication()
        setupAnchorSubscribers()
        setupAnchorSubscribe()
    }

    private func setAnchorUserImageView() {
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    }

    private func setAnchorAddButton() {
        addButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        addButton.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -22)
            .isActive = true
        addButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor).isActive = true
    }

    private func setAnchorNamePerson() {
        namePerson.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10).isActive = true
        namePerson.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    }

    private func setAnchorJobTitle() {
        jobTitle.topAnchor.constraint(equalTo: namePerson.bottomAnchor, constant: 11).isActive = true
        jobTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    }

    private func setAnchorLink() {
        link.topAnchor.constraint(equalTo: jobTitle.bottomAnchor, constant: 11).isActive = true
        link.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
    }

    private func setAnchorChangeButtom() {
        changeButtom.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 15).isActive = true
        changeButtom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        changeButtom.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeButtom.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setAnchorShareProfileButton() {
        shareProfileButton.leadingAnchor.constraint(equalTo: changeButtom.trailingAnchor, constant: 5).isActive = true
        shareProfileButton.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 15).isActive = true
        shareProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }

    private func setupAnchorAddPeopleButton() {
        addPeopleButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5)
            .isActive = true
        addPeopleButton.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 15).isActive = true
        addPeopleButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addPeopleButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    private func setupAnchorPublication() {
        publicationsNumLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 68)
            .isActive = true
        publicationsNumLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10).isActive = true

        publicationsLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 46)
            .isActive = true
        publicationsLabel.topAnchor.constraint(equalTo: publicationsNumLabel.bottomAnchor, constant: 2).isActive = true
    }

    private func setupAnchorSubscribers() {
        subscribersNumLabel.leadingAnchor.constraint(equalTo: publicationsNumLabel.trailingAnchor, constant: 50)
            .isActive = true
        subscribersNumLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10).isActive = true

        subscribersLabel.leadingAnchor.constraint(equalTo: publicationsLabel.trailingAnchor, constant: 10)
            .isActive = true
        subscribersLabel.topAnchor.constraint(equalTo: subscribersNumLabel.bottomAnchor, constant: 2).isActive = true
    }

    private func setupAnchorSubscribe() {
        subscribeNumLabel.leadingAnchor.constraint(equalTo: subscribersNumLabel.trailingAnchor, constant: 35)
            .isActive = true
        subscribeNumLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10).isActive = true

        subscribeLabel.leadingAnchor.constraint(equalTo: subscribersLabel.trailingAnchor, constant: 10).isActive = true
        subscribeLabel.topAnchor.constraint(equalTo: subscribeNumLabel.bottomAnchor, constant: 2).isActive = true
    }

    @objc private func linkButtonTapped() {
        present?()
    }
}
