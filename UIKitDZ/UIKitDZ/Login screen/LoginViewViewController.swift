// LoginViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс LoginViewViewController для создания view's для LoginViewController
class LoginViewViewController: UIView {
    // MARK: - Public Methods

    public var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AmaticSC-Bold", size: 55)
        label.text = "КОФЕИНОВЪ"
        label.textColor = UIColor(red: 207 / 255, green: 180 / 255, blue: 150 / 255, alpha: 1.0)
        label.frame = CGRect(x: 100, y: 103, width: 300, height: 80)
        return label
    }()

    public var uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 250, width: 375, height: 564)
        view.layer.cornerRadius = 20
        return view
    }()

    public var autorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = UIFont(name: "Verdana-Bold", size: 26)
        label.frame = CGRect(x: 20, y: 280, width: 195, height: 32)
        return label
    }()

    public var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 332, width: 175, height: 20)
        return label
    }()

    public var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите почту"
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 361, width: 350, height: 17)
        return textField
    }()

    public var uiViewTextField: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray
        uiView.frame = CGRect(x: 20, y: 386, width: 335, height: 1)
        return uiView
    }()

    public var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 407, width: 175, height: 20)
        return label
    }()

    public var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 436, width: 350, height: 20)
        textField.isSecureTextEntry = true
        return textField
    }()

    public var uiViewPasswordField: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray
        uiView.frame = CGRect(x: 20, y: 462, width: 335, height: 1)
        return uiView
    }()

    public var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.frame = CGRect(x: 332, y: 433, width: 22, height: 19)
        button.tintColor = .lightGray
        return button
    }()

    public let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 0.4)
        button.frame = CGRect(x: 20, y: 664, width: 335, height: 45)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.verdana18
        button.isEnabled = true
        return button
    }()
}
