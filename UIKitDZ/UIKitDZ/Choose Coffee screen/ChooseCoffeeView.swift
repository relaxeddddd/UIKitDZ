// ChooseCoffeeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для создания объектов на экран с выбором кофе
final class ChooseCoffeeView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let roasting = "Тёмная \nобжарка"
        static let addIngredients = "Дополнительные \nингредiенты"
        static let price = "Цѣна - 100 руб"
    }

    // MARK: - Public Properties

    var segmentItems = ["Американо", "Капучино", "Латте"]

    // MARK: - Visual Components

    public let uiViewBackground: UIView = {
        let uiViewBackground = UIView()
        uiViewBackground.backgroundColor = UIColor(red: 234 / 255, green: 212 / 255, blue: 188 / 255, alpha: 1.0)
        uiViewBackground.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        return uiViewBackground
    }()

    public lazy var imageCoffee: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "simpleCoffee")
        image.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        return image
    }()

    public lazy var segmentControl: UISegmentedControl = {
        var segmentControl = UISegmentedControl()
        segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()

    public let modificationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.verdana18
        label.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        return label
    }()

    public let coffeeBeansButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
        button.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        button.layer.cornerRadius = 12
        return button
    }()

    public let beansImageView: UIImageView = {
        let beansImageView = UIImageView()
        beansImageView.image = UIImage(named: "beans")
        beansImageView.frame = CGRect(x: 46, y: 499, width: 100, height: 100)
        return beansImageView
    }()

    public let beansLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.roasting
        label.font = UIFont(name: "Verdana", size: 13)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 15, y: 599, width: 165, height: 42)
        return label
    }()

    public let ingredientsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
        button.frame = CGRect(x: 195, y: 482, width: 165, height: 165)
        button.layer.cornerRadius = 12
        return button
    }()

    public let pluseImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pluse")
        image.frame = CGRect(x: 262, y: 538, width: 29, height: 29)
        return image
    }()

    public let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.addIngredients
        label.font = UIFont(name: "Verdana", size: 13)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.frame = CGRect(x: 195, y: 599, width: 165, height: 42)
        return label
    }()

    public let priceLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.price
        label.font = UIFont.verdana18
        label.textAlignment = .right
        label.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        return label
    }()

    public let enterButton = EnableEnterCustomButton(
        frame: CGRect(x: 15, y: 717, width: 345, height: 53),
        text: "Заказать"
    )
}
