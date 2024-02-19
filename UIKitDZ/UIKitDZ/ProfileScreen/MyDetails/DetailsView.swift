// DetailsView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для добавления view's на экран деталей пользователя
final class DetailsView: UIView {
    // MARK: - Visual Components

    var nameTextField = CustomTextFieldFromDetalis(placeholder: "Name")
    var surnameTextField = CustomTextFieldFromDetalis(placeholder: "Фамилия")
    var telephoneTextField = CustomTextFieldFromDetalis(placeholder: "Номер телефона")
    var sizeFootTextField = CustomTextFieldFromDetalis(placeholder: "Размер ноги")
    var birthdayTextField = CustomTextFieldFromDetalis(placeholder: "Дата рождения")
    var emailTextField = CustomTextFieldFromDetalis(placeholder: "Почта")

    var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 225 / 255, green: 24 / 255, blue: 131 / 255, alpha: 1.0)
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(telephoneTextField)
        addSubview(sizeFootTextField)
        addSubview(birthdayTextField)
        addSubview(emailTextField)
        addSubview(saveButton)
        setupTextFields()
        setupSaveButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(telephoneTextField)
        addSubview(sizeFootTextField)
        addSubview(birthdayTextField)
        addSubview(emailTextField)
        addSubview(saveButton)
        setupTextFields()
        setupSaveButton()
    }

    // MARK: - Private Methods

    private func setupTextFields() {
        nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 113).isActive = true

        surnameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        surnameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        surnameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true

        telephoneTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        telephoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        telephoneTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        telephoneTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10).isActive = true

        sizeFootTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        sizeFootTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        sizeFootTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sizeFootTextField.topAnchor.constraint(equalTo: telephoneTextField.bottomAnchor, constant: 10).isActive = true

        birthdayTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        birthdayTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        birthdayTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        birthdayTextField.topAnchor.constraint(equalTo: sizeFootTextField.bottomAnchor, constant: 10).isActive = true

        emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 10).isActive = true
    }

    private func setupSaveButton() {
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        saveButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 227).isActive = true
    }
}
