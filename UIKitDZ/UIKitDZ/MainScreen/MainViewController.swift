// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс MainViewController для показа главного экрана регистрации
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var loginTextField: UITextField?
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var eyeButton: UIButton!

    // MARK: - Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        eyeButton.addTarget(self, action: #selector(showPasswordTextField), for: .touchDown)
    }

    // MARK: - IBAction

    // Проверка правильно ли заполнены поля: логин, пароль
    @IBAction func enterButtonAction(_ sender: Any) {
        if loginTextField!.text!.isEmpty || !loginTextField!.text!.contains("@mail.ru") || passwordTextField.text!
            .isEmpty
        {
            let alertController = UIAlertController(
                title: "Ошибка",
                message: "Введите коректную почту и пароль",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "Oк", style: .default))
            present(alertController, animated: true)
        } else {
            UserInfo.shared.login = loginTextField?.text
        }
    }

    // MARK: - Private Methods

    // Просмотр пароля
    @objc private func showPasswordTextField() {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }
}
