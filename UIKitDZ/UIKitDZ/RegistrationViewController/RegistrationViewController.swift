// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для показа экрана входа
final class RegistrationViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
        addViews()
        /// подписываемся на делегаты TextField's
        registrationView.emailTextField.delegate = self
        registrationView.passwordTextField.delegate = self
    }

    // MARK: - Private Methods

    ///  Показ пароля
    @objc private func showPassword() {
        if registrationView.passwordTextField.isSecureTextEntry {
            registrationView.passwordTextField.isSecureTextEntry = false
            registrationView.eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else {
            registrationView.passwordTextField.isSecureTextEntry = true
            registrationView.eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
    }

    /// Заполнение  TextField's при нажатии на switch
    @objc private func authorizationFaceId(sender: UISwitch) {
        if sender.isOn {
            registrationView.emailTextField.text = DataModel().email
            registrationView.passwordTextField.text = DataModel().password
            registrationView.enterButton.isEnabled = true
            registrationView.enterButton.backgroundColor = UIColor(
                red: 233 / 255,
                green: 70 / 255,
                blue: 94 / 255,
                alpha: 1.0
            )
        }
    }

    /// Изменение состояния кнопки в зависимости от наполнения TextField's
    @objc private func textFieldDidChange(textField: UITextField) {
        if let text1 = registrationView.emailTextField.text, let text2 = registrationView.passwordTextField.text {
            if !text1.isEmpty, !text2.isEmpty {
                registrationView.enterButton.isEnabled = true
                registrationView.enterButton.backgroundColor = UIColor(
                    red: 233 / 255,
                    green: 70 / 255,
                    blue: 94 / 255,
                    alpha: 1.0
                )
            } else {
                registrationView.enterButton.isEnabled = false
                registrationView.enterButton.backgroundColor = UIColor(
                    red: 233 / 255,
                    green: 70 / 255,
                    blue: 94 / 255,
                    alpha: 0.4
                )
            }
        }
    }

    /// Добаввления элементов на контроллер
    private func addViews() {
        view.backgroundColor = .white
        view.addSubview(registrationView.image)
        view.addSubview(registrationView.title)
        view.addSubview(registrationView.signInLabel)
        view.addSubview(registrationView.emailLabel)
        view.addSubview(registrationView.emailTextField)
        view.addSubview(registrationView.uiViewTextField)
        view.addSubview(registrationView.passwordLabel)
        view.addSubview(registrationView.passwordTextField)
        view.addSubview(registrationView.uiViewPasswordField)
        view.addSubview(registrationView.eyeButton)
        view.addSubview(registrationView.useFaceIdLabel)
        view.addSubview(registrationView.switchFaceId)
        view.addSubview(registrationView.enterButton)
    }

    /// Добавления addTarget к элементам
    private func addTarget() {
        registrationView.eyeButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        registrationView.switchFaceId.addTarget(self, action: #selector(authorizationFaceId), for: .valueChanged)
        registrationView.enterButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        registrationView.emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        registrationView.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    /// Переход на следующий VC
    @objc private func tappedButton() {
        let secondViewController = PersonsBirthdayViewController()
        navigationController?
            .pushViewController(secondViewController, animated: true)
    }

    // MARK: - Constants

    let registrationView = RegistrationViewViewController()
}
