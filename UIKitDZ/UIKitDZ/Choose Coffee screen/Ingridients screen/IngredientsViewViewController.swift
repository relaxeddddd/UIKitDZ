// IngredientsViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс IngredientsViewViewController для добавления view's на IngredientsViewController
class IngredientsViewViewController: UIView {
    // MARK: - Public Properties

    var switches = [UISwitch]()

    // MARK: - Public Methods

    /// Массив свитчей
    public let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        return button
    }()

    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите дополнительные \nингредіенты"
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.verdana18
        label.textAlignment = .center
        label.frame = CGRect(x: 40, y: 53, width: 294, height: 44)
        return label
    }()

    // Молоко
    public lazy var milkSwitch: UISwitch = {
        let milkSwitch = UISwitch()
        switches.append(milkSwitch)
        milkSwitch.frame = CGRect(x: 301, y: 124, width: 20, height: 20)
        return milkSwitch
    }()

    public let milkLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко "
        label.frame = CGRect(x: 20, y: 124, width: 275, height: 35)
        return label
    }()

    // Сироп
    public lazy var siropSwitch: UISwitch = {
        let siropSwitch = UISwitch()
        switches.append(siropSwitch)
        siropSwitch.frame = CGRect(x: 301, y: 174, width: 20, height: 20)
        return siropSwitch
    }()

    public let siropLabel: UILabel = {
        let label = UILabel()
        label.text = "Сироп "
        label.frame = CGRect(x: 20, y: 174, width: 275, height: 35)
        return label
    }()

    // Соевое молоко
    public lazy var milkSoyaSwitch: UISwitch = {
        let milkSoyaSwitch = UISwitch()
        switches.append(milkSoyaSwitch)
        milkSoyaSwitch.frame = CGRect(x: 301, y: 224, width: 20, height: 20)
        return milkSoyaSwitch
    }()

    public let milkSoyaLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко соевое "
        label.frame = CGRect(x: 20, y: 224, width: 275, height: 35)
        return label
    }()

    // Миндальное молоко
    public lazy var milkMindalSwitch: UISwitch = {
        let milkMindalSwitch = UISwitch()
        switches.append(milkMindalSwitch)
        milkMindalSwitch.frame = CGRect(x: 301, y: 274, width: 20, height: 20)
        return milkMindalSwitch
    }()

    public let milkMindalLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко миндальное "
        label.frame = CGRect(x: 20, y: 274, width: 275, height: 35)
        return label
    }()

    // Эспрессо
    public lazy var espressoSwitch: UISwitch = {
        let espressoSwitch = UISwitch()
        switches.append(espressoSwitch)
        espressoSwitch.frame = CGRect(x: 301, y: 324, width: 20, height: 20)
        return espressoSwitch
    }()

    public let espressoLabel: UILabel = {
        let label = UILabel()
        label.text = "Эспрессо 50мл "
        label.frame = CGRect(x: 20, y: 324, width: 275, height: 35)
        return label
    }()
}
