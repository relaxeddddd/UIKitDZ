// ProfileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Создание view's для экрана профиля
final class ProfileView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let numberCard = "1000 0001 0102"
        static let discont = "15%"
        static let privateDataTitle = "Личные данные"
    }

    // MARK: - Visual Components

    let uiViewBackgroundCard: UIView = {
        let uiViewBackgroundCard = UIView()
        uiViewBackgroundCard.backgroundColor = .black
        uiViewBackgroundCard.translatesAutoresizingMaskIntoConstraints = false
        uiViewBackgroundCard.layer.cornerRadius = 20
        uiViewBackgroundCard.layer.shadowColor = UIColor.black.cgColor
        uiViewBackgroundCard.layer.shadowOpacity = 0.5
        uiViewBackgroundCard.layer.shadowOffset = CGSize(width: 0, height: 4)
        uiViewBackgroundCard.layer.shadowRadius = 10
        return uiViewBackgroundCard
    }()

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let discontLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.discont
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qrCode")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let qrCodeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()

    let numberCardLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.numberCard
        label.textColor = .white
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let aboutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "about")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let aboutBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }()

    let privateDataLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.privateDataTitle
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let myDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Мои данные", for: .normal)
        button.setImage(UIImage(named: "myData"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let underlineUiViewOne = UnderlineButton()

    let inviteFriendButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Приведи друга", for: .normal)
        button.setImage(UIImage(named: "inviteFriend"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let underlineUiViewTwo = UnderlineButton()

    let supportButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Обратная связь", for: .normal)
        button.setImage(UIImage(named: "support"), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let underlineUiViewThree = UnderlineButton()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(uiViewBackgroundCard)
        addSubview(logoImageView)
        addSubview(discontLabel)
        addSubview(numberCardLabel)
        addSubview(qrCodeImageView)
        addSubview(qrCodeBackgroundView)
        addSubview(aboutImageView)
        addSubview(aboutBackgroundView)
        addSubview(privateDataLabel)
        addSubview(myDataButton)
        addSubview(inviteFriendButton)
        addSubview(supportButton)
        addSubview(underlineUiViewOne)
        addSubview(underlineUiViewTwo)
        addSubview(underlineUiViewThree)
        setupUiViewBackgroundCard()
        setupLogoImageView()
        setupDiscontLabel()
        setupNumberCardLabel()
        setupQrCodeBackgroundView()
        setupQrCodeImageView()
        setupAboutBackgroundView()
        setupAboutImageView()
        setupPrivateDataLabel()
        setupmyButtons()
        setupunderLines()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupUiViewBackgroundCard() {
        uiViewBackgroundCard.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        uiViewBackgroundCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        uiViewBackgroundCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        uiViewBackgroundCard.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }

    private func setupLogoImageView() {
        logoImageView.topAnchor.constraint(equalTo: uiViewBackgroundCard.topAnchor, constant: 16).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: uiViewBackgroundCard.leadingAnchor, constant: 8).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupDiscontLabel() {
        discontLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        discontLabel.leadingAnchor.constraint(equalTo: uiViewBackgroundCard.leadingAnchor, constant: 14).isActive = true
    }

    private func setupNumberCardLabel() {
        numberCardLabel.leadingAnchor.constraint(equalTo: uiViewBackgroundCard.leadingAnchor, constant: 14)
            .isActive = true
        numberCardLabel.topAnchor.constraint(equalTo: discontLabel.bottomAnchor, constant: 10).isActive = true
    }

    private func setupQrCodeBackgroundView() {
        qrCodeBackgroundView.topAnchor.constraint(equalTo: uiViewBackgroundCard.topAnchor, constant: 13).isActive = true
        qrCodeBackgroundView.trailingAnchor.constraint(equalTo: uiViewBackgroundCard.trailingAnchor, constant: -13)
            .isActive = true
        qrCodeBackgroundView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        qrCodeBackgroundView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupQrCodeImageView() {
        qrCodeImageView.centerYAnchor.constraint(equalTo: qrCodeBackgroundView.centerYAnchor).isActive = true
        qrCodeImageView.centerXAnchor.constraint(equalTo: qrCodeBackgroundView.centerXAnchor).isActive = true
    }

    private func setupAboutBackgroundView() {
        aboutBackgroundView.bottomAnchor.constraint(equalTo: uiViewBackgroundCard.bottomAnchor, constant: -20)
            .isActive = true
        aboutBackgroundView.rightAnchor.constraint(equalTo: uiViewBackgroundCard.rightAnchor, constant: -14)
            .isActive = true
        aboutBackgroundView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        aboutBackgroundView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setupAboutImageView() {
        aboutImageView.centerXAnchor.constraint(equalTo: aboutBackgroundView.centerXAnchor).isActive = true
        aboutImageView.centerYAnchor.constraint(equalTo: aboutBackgroundView.centerYAnchor).isActive = true
    }

    private func setupPrivateDataLabel() {
        privateDataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        privateDataLabel.topAnchor.constraint(equalTo: uiViewBackgroundCard.bottomAnchor, constant: 28).isActive = true
    }

    private func setupmyButtons() {
        myDataButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23).isActive = true
        myDataButton.topAnchor.constraint(equalTo: uiViewBackgroundCard.bottomAnchor, constant: 74).isActive = true
        myDataButton.widthAnchor.constraint(equalToConstant: 181).isActive = true
        myDataButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        inviteFriendButton.topAnchor.constraint(equalTo: myDataButton.bottomAnchor, constant: 33).isActive = true
        inviteFriendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23).isActive = true
        inviteFriendButton.widthAnchor.constraint(equalToConstant: 181).isActive = true
        inviteFriendButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        supportButton.topAnchor.constraint(equalTo: inviteFriendButton.bottomAnchor, constant: 33).isActive = true
        supportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23).isActive = true
        supportButton.widthAnchor.constraint(equalToConstant: 181).isActive = true
        supportButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }

    private func setupunderLines() {
        underlineUiViewOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        underlineUiViewOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        underlineUiViewOne.topAnchor.constraint(equalTo: myDataButton.bottomAnchor, constant: 9).isActive = true
        underlineUiViewOne.heightAnchor.constraint(equalToConstant: 1).isActive = true

        underlineUiViewTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        underlineUiViewTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        underlineUiViewTwo.topAnchor.constraint(equalTo: inviteFriendButton.bottomAnchor, constant: 9).isActive = true
        underlineUiViewTwo.heightAnchor.constraint(equalToConstant: 1).isActive = true

        underlineUiViewThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        underlineUiViewThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        underlineUiViewThree.topAnchor.constraint(equalTo: supportButton.bottomAnchor, constant: 9).isActive = true
        underlineUiViewThree.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
