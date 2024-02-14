// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class MenuViewController: UIViewController {
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // коричневый экран
        view.backgroundColor = UIColor(named: "newBrown")
    }

    // лого кофейни
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 100, y: 49, width: 175, height: 76)
        imageView.image = UIImage(named: "coffeLogoImage")
        return imageView
    }()

    // приветствие
    lazy var greetingTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        textView.text = "Добро пожаловать,\nГость"
        textView.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        textView.backgroundColor = UIColor.clear
        textView.textAlignment = .left
        textView.font = UIFont(name: "Verdana-Bold", size: 13.0)
        return textView
    }()

    // круг с буквой Г
    lazy var circleImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        imageView.image = UIImage(named: "circleImage")
        return imageView
    }()

    lazy var letterLabel: UILabel = {
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

    // белая вью
    lazy var newView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()

    lazy var coffeeAddressesView: UIView = {
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

    // лого меню
    lazy var menuLogoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 124, y: 122, width: 125, height: 80))
        imageView.image = UIImage(named: "menuImage")
        return imageView
    }()

    // Первая позиция меню "Пти пате"
    lazy var rectangleOne: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 216, width: 335, height: 80))
        imageView.image = UIImage(named: "rectangleImage")
        return imageView
    }()

    lazy var ptiPateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        label.text = "Пти пате aля «РюсЪ»"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-BoldItalic", size: 14.0)
        label.textAlignment = .left
        return label
    }()

    lazy var cakeImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 221, width: 70, height: 70))
        imageView.image = UIImage(named: "cakeImage")
        return imageView
    }()

    // вторая позиция меню
    lazy var rectangleTwo: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 316, width: 335, height: 80))
        imageView.image = UIImage(named: "rectangleImage")
        return imageView
    }()

    lazy var hotBeveragesLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        label.text = "Горячiя напитки"
        label.textColor = .black
        label.font = UIFont(name: "Verdana-BoldItalic", size: 14.0)
        label.textAlignment = .left
        return label
    }()

    lazy var capImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 252, y: 15, width: 70, height: 48))
        imageView.image = UIImage(named: "capCoffeeImage")
        return imageView
    }()

    // третья позиция/ кнопка
    lazy var rectangleThree: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 416, width: 335, height: 80))
        imageView.image = UIImage(named: "rectangleImage")
        return imageView
    }()

    lazy var capSpoonImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        imageView.image = UIImage(named: "capSpoonImage")
        return imageView
    }()

    lazy var coffeeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 25, y: 30, width: 180, height: 19))
        label.text = "Кофий"
        label.font = UIFont(name: "Verdana-BoldItalic", size: 14.0)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    lazy var coffeeButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: rectangleThree.frame.width,
            height: rectangleThree.frame.height
        ))
        button.backgroundColor = .clear
        return button
    }()

    private func setupViews() {
        view.addSubview(logoImageView)
        view.addSubview(greetingTextView)
        view.addSubview(circleImageView)
        circleImageView.addSubview(letterLabel)
        view.addSubview(newView)
        newView.addSubview(coffeeAddressesView)
        newView.addSubview(menuLogoImageView)
        newView.addSubview(rectangleOne)
        rectangleOne.addSubview(ptiPateLabel)
        newView.addSubview(cakeImage)
        newView.addSubview(rectangleTwo)
        rectangleTwo.addSubview(hotBeveragesLabel)
        rectangleTwo.addSubview(capImage)
        newView.addSubview(rectangleThree)
        rectangleThree.addSubview(capSpoonImageView)
        rectangleThree.addSubview(coffeeLabel)
        rectangleThree.addSubview(coffeeButton)
    }
}
