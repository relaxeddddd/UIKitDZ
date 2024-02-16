// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран меню для кофейни
final class MenuViewController: UIViewController {
    // MARK: - Visual Component

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 100, y: 49, width: 175, height: 76)
        imageView.image = UIImage(named: "coffeLogoImage")
        return imageView
    }()

    private lazy var greetingTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        textView.text = "Добро пожаловать,\nГость"
        textView.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        textView.backgroundColor = UIColor.clear
        textView.textAlignment = .left
        textView.font = UIFont(name: "Verdana-Bold", size: 13.0)
        return textView
    }()

    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        imageView.image = UIImage(named: "circleImage")
        return imageView
    }()

    private lazy var letterLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 0,
            y: 0,
            width: circleImageView.frame.width,
            height: circleImageView.frame.height
        ))
        label.text = "Г"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 20)
        return label
    }()

    private lazy var newView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var coffeeAddressesView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 40, width: 335, height: 70))

        let backgroundImageView = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ))
        backgroundImageView.image = UIImage(named: "rectangleMint")
        view.addSubview(backgroundImageView)

        let addressLabel = UILabel(frame: CGRect(x: 15, y: 12, width: 150, height: 15))
        addressLabel.text = "Адреса кофеен"
        addressLabel.textColor = .black
        addressLabel.backgroundColor = .clear
        addressLabel.font = UIFont(name: "Verdana-Bold", size: 14.0)
        view.addSubview(addressLabel)
        
       enum Constants {
            static let permissionTitleFirstPart = "Разрѣшите"
            static let permissionTitleSecondPart = "доступъ"
            static let permissionTitleThirdPart = "къ"
            
            static let locationText = "геолокаціи"
            static let locationTextSecondPart = "для"
            
            static let searchCoffeeShopTextFirstPart = "поиска"
            static let searchCoffeeShopTextSecondPart = "ближайшей"
            static let searchCoffeeShopTextThirdPart = "кофейни"
        }

        let geolocationLabel = UILabel(frame: CGRect(x: 15, y: 30, width: 260, height: 30))
        geolocationLabel.textColor = .lightGray
        geolocationLabel.font = UIFont(name: "Verdana", size: 10.0)
        geolocationLabel.text = "Разрѣшите доступъ къ ​геолокаціи для\nпоиска ближайшей кофейни"
        geolocationLabel.numberOfLines = 2
        view.addSubview(geolocationLabel)

        let dotImageView = UIImageView(frame: CGRect(x: 289, y: 19, width: 20, height: 30))
        dotImageView.image = UIImage(named: "dotImage")
        view.addSubview(dotImageView)

        return view
    }()

    private lazy var menuLogoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 124, y: 122, width: 125, height: 80))
        imageView.image = UIImage(named: "menuImage")
        return imageView
    }()

    private lazy var rectangleOneImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 216, width: 335, height: 80))
        imageView.image = UIImage(named: "rectangleImage")
        return imageView
    }()

    private lazy var ptiPateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        label.text = "Пти пате aля «РюсЪ»"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-BoldItalic", size: 14.0)
        label.textAlignment = .left
        return label
    }()

    private lazy var cakeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 221, width: 70, height: 70))
        imageView.image = UIImage(named: "cakeImage")
        return imageView
    }()

    private lazy var rectangleTwoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 316, width: 335, height: 80))
        imageView.image = UIImage(named: "rectangleImage")
        return imageView
    }()

    private lazy var hotBeveragesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        label.text = "Горячiя напитки"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-BoldItalic", size: 14.0)
        label.textAlignment = .left
        return label
    }()

    private lazy var capImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 252, y: 15, width: 70, height: 48))
        imageView.image = UIImage(named: "capCoffeeImage")
        return imageView
    }()

    private lazy var rectangleThreeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 416, width: 335, height: 80))
        imageView.image = UIImage(named: "rectangleImage")
        return imageView
    }()

    private lazy var capSpoonImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        imageView.image = UIImage(named: "capSpoonImage")
        return imageView
    }()

    private lazy var coffeeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        label.text = "Кофий"
        label.font = UIFont(name: "Verdana-BoldItalic", size: 14.0)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private lazy var coffeeButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: rectangleThreeImageView.frame.width,
            height: rectangleThreeImageView.frame.height
        ))
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(coffeeButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // коричневый экран
        view.backgroundColor = UIColor(named: "newBrown")
    }

    // MARK: - Private Methods

    private func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(greetingTextView)
        view.addSubview(circleImageView)
        circleImageView.addSubview(letterLabel)
        view.addSubview(newView)
        newView.addSubview(coffeeAddressesView)
        newView.addSubview(menuLogoImageView)
        newView.addSubview(rectangleOneImageView)
        rectangleOneImageView.addSubview(ptiPateLabel)
        newView.addSubview(cakeImageView)
        newView.addSubview(rectangleTwoImageView)
        rectangleTwoImageView.addSubview(hotBeveragesLabel)
        rectangleTwoImageView.addSubview(capImageView)
        newView.addSubview(rectangleThreeImageView)
        rectangleThreeImageView.addSubview(capSpoonImageView)
        rectangleThreeImageView.addSubview(coffeeLabel)
        rectangleThreeImageView.addSubview(coffeeButton)
    }

    // кнопка для перехода
    @objc private func coffeeButtonTapped() {
        let coffeeMenuVC = ChooseCoffeeViewController()
        navigationController?.pushViewController(coffeeMenuVC, animated: true)
    }
}
