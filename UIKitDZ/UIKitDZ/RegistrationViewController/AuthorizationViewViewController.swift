// AuthorizationViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс RegistrationViewViewController для создания элементов для экрана регистрации
class AuthorizationViewViewController: UIView {
    // MARK: - Public Properties

    public var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "registrationImage")
        image.frame = CGRect(x: 140, y: 70, width: 125, height: 125)
        return image
    }()

    public var title: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1.0)
        label.frame = CGRect(x: 115, y: 200, width: 175, height: 44)
        return label
    }()

    public var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = UIFont(name: "Verdana-Bold", size: 26)
        label.textColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
        label.frame = CGRect(x: 20, y: 280, width: 175, height: 31)
        return label
    }()

    public var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
        label.frame = CGRect(x: 20, y: 335, width: 175, height: 31)
        return label
    }()

    public var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing email"
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 365, width: 350, height: 31)
        return textField
    }()

    public var uiViewTextField: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray
        uiView.frame = CGRect(x: 20, y: 395, width: 350, height: 1)
        return uiView
    }()

    public var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
        label.frame = CGRect(x: 20, y: 415, width: 175, height: 31)
        return label
    }()

    public var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing password"
        textField.textColor = .black
        textField.borderStyle = .none
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 445, width: 350, height: 31)
        textField.isSecureTextEntry = true
        return textField
    }()

    public var uiViewPasswordField: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .lightGray
        uiView.frame = CGRect(x: 20, y: 475, width: 350, height: 1)
        return uiView
    }()

    public var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.frame = CGRect(x: 338, y: 450, width: 40, height: 22)
        button.tintColor = .lightGray
        return button
    }()

    public var useFaceIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Use FaceID"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .black
        label.frame = CGRect(x: 100, y: 570, width: 175, height: 31)
        return label
    }()

    public var switchFaceId: UISwitch = {
        let switchId = UISwitch()
        switchId.isOn = false
        switchId.frame = CGRect(x: 230, y: 570, width: 0, height: 0)
        return switchId
    }()

    public var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 0.4)
        button.frame = CGRect(x: 20, y: 720, width: 350, height: 45)
        button.isEnabled = false
        return button
    }()
}
