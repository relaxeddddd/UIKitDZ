// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ViewController который отвечает за показ экрана авторизации
final class LoginViewController: UIViewController {
    // MARK: - Public Properties

    private let loginView = LoginView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }

    // MARK: - Private Methods

    // Добавления views на экран
    private func addViews() {
        view.addSubview(loginView.titleLabel)
        view.addSubview(loginView.uiView)
        view.addSubview(loginView.autorizationLabel)
        view.addSubview(loginView.emailLabel)
        view.addSubview(loginView.emailTextField)
        loginView.emailTextField.addTarget(
            self,
            action: #selector(textFieldDidChange(textField:)),
            for: .editingChanged
        )
        view.addSubview(loginView.uiViewTextField)
        view.addSubview(loginView.passwordLabel)
        view.addSubview(loginView.passwordTextField)
        loginView.passwordTextField.delegate = self
        loginView.passwordTextField.addTarget(
            self,
            action: #selector(textFieldDidChange(textField:)),
            for: .editingChanged
        )
        view.addSubview(loginView.uiViewPasswordField)
        view.addSubview(loginView.eyeButton)
        loginView.eyeButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        view.addSubview(loginView.enterButton)
        loginView.enterButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }

    // Переход на следующий VC после нажатия на кнопку
    @objc private func tappedButton() {
        let navigationViewController =
            UINavigationController(rootViewController: MenuViewController()) // Поменять на Ксю
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }

    // Показ пароля по нажатию на кнопку глаза
    @objc private func showPassword() {
        if loginView.passwordTextField.isSecureTextEntry {
            loginView.passwordTextField.isSecureTextEntry = false
            loginView.eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            loginView.passwordTextField.isSecureTextEntry = true
            loginView.eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }

    // Проверка на заполненность TextField's и активация кнопки
    @objc private func textFieldDidChange(textField: UITextField) {
        if let text1 = loginView.passwordTextField.text, let text2 = loginView.emailTextField.text {
            if !text1.isEmpty, !text2.isEmpty {
                loginView.enterButton.isEnabled = true
                loginView.enterButton.backgroundColor = UIColor.costumEnableBlue
            } else {
                loginView.enterButton.isEnabled = false
                loginView.enterButton.backgroundColor = UIColor.costumNotenableBlue
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {}
