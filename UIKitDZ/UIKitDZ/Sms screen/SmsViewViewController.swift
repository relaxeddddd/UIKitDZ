// SmsViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс SmsViewViewController для добавление view's на экран SmsViewController
class SmsViewViewController: UIView {
    // MARK: - Visual Components

    public let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите кодъ изъ смс, чтобы \nподтвердить оплату"
        label.font = UIFont(name: "Verdana", size: 14)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.frame = CGRect(x: 30, y: 146, width: 315, height: 44)
        return label
    }()

    public let smsTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        textField.font = UIFont.verdana18
        textField.layer.borderColor = UIColor(red: 196 / 255, green: 196 / 255, blue: 196 / 255, alpha: 1.0).cgColor
        textField.frame = CGRect(x: 56, y: 217, width: 262, height: 44)
        return textField
    }()

    public let sendAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить снова", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1.0), for: .normal)
        button.backgroundColor = UIColor(red: 249 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
        button.frame = CGRect(x: 104, y: 288, width: 167, height: 36)
        return button
    }()

    public let acceptButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor.costumNotenableBlue
        button.frame = CGRect(x: 15, y: 632, width: 345, height: 53)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.verdana18
        button.isEnabled = true
        return button
    }()
}
