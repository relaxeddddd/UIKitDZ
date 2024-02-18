// MyDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Клаасс для отображения экрана информации о пользователе
class MyDetailsViewController: UIViewController {
    // MARK: - Contstants

    private enum Constants {
        static let phonePatern = "(\\d{1})(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        static let phoneFormat = "$1 ($2) $3-$4-$5"
        static let emailPatern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let emailFormat = "SELF MATCHES %@"
    }

    // MARK: - Visual Components

    private let pickerDate = UIDatePicker()

    // MARK: - Public Properties

    var detailsView = DetailsView()

    // MARK: - Lyfe Cicly

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupNavigationItems()
        setupTextFields()
        addTarget()
        addinformationInTextField()
        setupDataPicker()
        addDoneButtonToKeyboard(textField: detailsView.birthdayTextField)
    }

    override func loadView() {
        super.loadView()
        view = detailsView
    }

    // MARK: - Private Methods

    private func setupTextFields() {
        detailsView.telephoneTextField.keyboardType = .numberPad
        detailsView.telephoneTextField.delegate = self
    }

    private func addTarget() {
        detailsView.saveButton.addTarget(self, action: #selector(saveButton), for: .touchUpInside)
        detailsView.sizeFootTextField.addTarget(self, action: #selector(goToSizeFoot), for: .editingDidBegin)
    }

    private func addDoneButtonToKeyboard(textField: UITextField) {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
            target: nil,
            action: nil
        )
        let done = UIBarButtonItem(
            title: "Готово",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(doneButtonTapped)
        )
        doneToolbar.items = [flexSpace, done]
        doneToolbar.sizeToFit()
        textField.inputAccessoryView = doneToolbar
    }

    private func setupDataPicker() {
        pickerDate.preferredDatePickerStyle = .inline
        pickerDate.datePickerMode = .date
        detailsView.birthdayTextField.inputView = pickerDate
    }

    private func setupNavigationItems() {
        navigationItem.title = "Мои данные"
        let customBackButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(goBack))
        customBackButton.image = UIImage(named: "arrowBack")
        customBackButton.tintColor = .black
        navigationItem.leftBarButtonItem = nil
        navigationItem.leftBarButtonItem = customBackButton
    }

    // Установка маски для телефона
    private func maskPhoneNumber(_ phoneNumber: String, phoneNumberWithPlus: Bool) -> String {
        let pattern = Constants.phonePatern
        let regex = try? NSRegularExpression(pattern: pattern, options: [])

        let maskedPhoneNumber = regex?.stringByReplacingMatches(
            in: phoneNumber,
            options: [],
            range: NSRange(location: 0, length: phoneNumber.count),
            withTemplate: Constants.phoneFormat
        )

        if phoneNumberWithPlus {
            return maskedPhoneNumber ?? phoneNumber
        } else {
            return "+" + (maskedPhoneNumber ?? phoneNumber)
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = Constants.emailPatern

        let emailPred = NSPredicate(format: Constants.emailFormat, emailRegEx)
        return emailPred.evaluate(with: email)
    }

    // Передача сохраненных данных в текстовые поля
    private func addinformationInTextField() {
        detailsView.nameTextField.text = User.name
        detailsView.surnameTextField.text = User.surname
        detailsView.telephoneTextField.text = User.number
        detailsView.sizeFootTextField.text = User.sizeFoot
        detailsView.birthdayTextField.text = User.birthday
        detailsView.emailTextField.text = User.email
    }

    @objc private func doneButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        detailsView.birthdayTextField.text = dateFormatter.string(from: pickerDate.date)
        detailsView.birthdayTextField.resignFirstResponder()
    }

    // Сохранение контента в UserDefaults
    @objc private func saveButton() {
        if isValidEmail(detailsView.emailTextField.text ?? "") {
            User.name = detailsView.nameTextField.text ?? ""
            User.surname = detailsView.surnameTextField.text ?? ""
            User.number = detailsView.telephoneTextField.text ?? ""
            User.sizeFoot = detailsView.sizeFootTextField.text ?? ""
            User.birthday = detailsView.birthdayTextField.text ?? ""
            User.email = detailsView.emailTextField.text ?? ""
            detailsView.saveButton.isHidden = true
            let alertController = UIAlertController(title: nil, message: "Данные сохранены", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(
                title: nil,
                message: "Введите коректно данные",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alertController, animated: true)
        }
    }

    @objc private func goToSizeFoot() {
        let sizeFootController = SizeViewController()
        sizeFootController.didSelectSizeHandler = { [weak self] size in
            self?.detailsView.sizeFootTextField.text = String(size)
        }
        sizeFootController.modalPresentationStyle = .overFullScreen
        present(sizeFootController, animated: true)
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension MyDetailsViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let textFieldText = textField.text else { return true }
        let newStringNumber = (textFieldText as NSString).replacingCharacters(in: range, with: string)
        let phoneNumberWithPlus = textFieldText.hasPrefix("+")
        textField.text = maskPhoneNumber(newStringNumber, phoneNumberWithPlus: phoneNumberWithPlus)
        return false
    }
}
