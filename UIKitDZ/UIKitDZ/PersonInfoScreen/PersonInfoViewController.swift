// PersonInfoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol PersonInfoViewControllerDelegate: AnyObject {
    func transferOfInformation(person: PersonInfo)
}

/// Класс PersonInfoViewController для отображения на экране пикеров
class PersonInfoViewController: UIViewController {
    // MARK: - Public Properties

    var delegate: PersonInfoViewControllerDelegate?

    // MARK: - Private Properties

    private var convertedDate = ""
    private var genderPickerView = UIPickerView()
    private var agePickerView = UIPickerView()
    private var birthdayPickerView = UIDatePicker()

    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        settingPickers()
        toolbarPicker()
        toolbarBirthdayPicker()
        personInfoView.cancleButton.addTarget(self, action: #selector(cancleView), for: .touchUpInside)
        personInfoView.addButton.addTarget(self, action: #selector(addPerson), for: .touchUpInside)
        personInfoView.telegramTextField.addTarget(self, action: #selector(showAlert), for: .editingDidBegin)
    }

    // MARK: - Private Methods

    /// Добавление view's на экран
    private func addViews() {
        view.backgroundColor = .white
        view.addSubview(personInfoView.cancleButton)
        view.addSubview(personInfoView.addButton)
        view.addSubview(personInfoView.imagePerson)
        view.addSubview(personInfoView.changePhotoLabel)
        view.addSubview(personInfoView.nameSurnameLabel)
        view.addSubview(personInfoView.nameSurnameTextField)
        view.addSubview(personInfoView.lineSurName)
        view.addSubview(personInfoView.birthdayLable)
        view.addSubview(personInfoView.birthdayTextField)
        view.addSubview(personInfoView.lineBirthday)
        view.addSubview(personInfoView.ageLable)
        view.addSubview(personInfoView.ageTextField)
        view.addSubview(personInfoView.lineAge)
        view.addSubview(personInfoView.genderLable)
        view.addSubview(personInfoView.genderTextField)
        view.addSubview(personInfoView.lineGender)
        view.addSubview(personInfoView.telegramLable)
        view.addSubview(personInfoView.telegramTextField)
        view.addSubview(personInfoView.lineTelegram)
    }

    /// Тулбары для gender и age
    private func toolbarPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let okButton = UIBarButtonItem(title: "Ок", style: .done, target: nil, action: #selector(acceptAction))
        toolbar.setItems([flexibleSpace, okButton], animated: true)

        /// Назначение тулбаров
        personInfoView.ageTextField.inputAccessoryView = toolbar
        personInfoView.genderTextField.inputAccessoryView = toolbar
    }

    /// Тулбар для birthday
    private func toolbarBirthdayPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: nil,
            action: #selector(acceptBirthdayButton)
        )
        toolbar.setItems([flexibleSpace, doneButton], animated: true)

        /// Назначение тулбара
        personInfoView.birthdayTextField.inputAccessoryView = toolbar
    }

    /// Настройка пикеров
    private func settingPickers() {
        personInfoView.genderTextField.inputView = genderPickerView
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.tag = 1
        personInfoView.genderTextField.inputView = genderPickerView

        personInfoView.ageTextField.inputView = agePickerView
        agePickerView.delegate = self
        agePickerView.dataSource = self
        agePickerView.tag = 2
        personInfoView.ageTextField.inputView = agePickerView

        personInfoView.birthdayTextField.inputView = birthdayPickerView
        birthdayPickerView.preferredDatePickerStyle = .wheels
        birthdayPickerView.datePickerMode = .date
    }

    @objc private func cancleView() {
        dismiss(animated: true)
    }

    /// Закрытие тулбаров через кнопку
    @objc private func acceptAction() {
        view.endEditing(true)
    }

    /// Закрытие тулбара picker birthday и заполнение textField данными
    @objc private func acceptBirthdayButton() {
        let dateFormator = DateFormatter()
        dateFormator.dateFormat = "dd.MM.yyyy"
        personInfoView.birthdayTextField.text = dateFormator.string(from: birthdayPickerView.date)

        if let dateInTextField = personInfoView.birthdayTextField.text {
            if let selectedDate = dateFormator.date(from: dateInTextField) {
                let convertedDateFormatter = DateFormatter()
                convertedDateFormatter.dateFormat = "dd.MM"
                convertedDate = convertedDateFormatter.string(from: selectedDate)
            }
        }
        view.endEditing(true)
    }

    /// Добавление персоны с помощью кнопки add
    @objc private func addPerson() {
        if personInfoView.nameSurnameTextField.text?.isEmpty ?? true ||
            personInfoView.birthdayTextField.text?.isEmpty ?? true ||
            personInfoView.ageTextField.text?.isEmpty ?? true ||
            personInfoView.genderTextField.text?.isEmpty ?? true ||
            personInfoView.telegramTextField.text?.isEmpty ?? true
        {
            let alertController = UIAlertController(
                title: "Ошибка!",
                message: "Введите все данные",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "Ок", style: .cancel))
            present(alertController, animated: true)
        } else {
            let person = PersonInfo(
                personImage: "emptyImage",
                personName: personInfoView.nameSurnameTextField.text ?? "",
                personDateOfBirthday: "\(convertedDate) - turns \(personInfoView.ageTextField.text ?? "")!",
                daysBeforeBirthday: "666 \ndays"
            )
            delegate?.transferOfInformation(person: person)

            let alertController = UIAlertController(
                title: "Поздравляем!",
                message: "Вы добавили нового человека",
                preferredStyle: .alert
            )
            let action = UIAlertAction(title: "Ок", style: .cancel) { _ in
                self.dismiss(animated: true)
            }
            alertController.addAction(action)
            present(alertController, animated: true)
        }
    }

    /// При нажатии на текстовое поле с телеграмом вызывается alertController
    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
            self.personInfoView.telegramTextField.text = alertController.textFields?.first?.text
        }
        let actionCancle = UIAlertAction(title: "Cancle", style: .default)
        alertController.addAction(actionCancle)
        alertController.addAction(actionOk)
        alertController.preferredAction = actionOk
        present(alertController, animated: true)
    }

    // MARK: - Constants

    let personInfoView = PersonInfoViewViewController()
    let sex = ["Мужчина", "Женщина"]
}

/// Расширения для пикеров
extension PersonInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return sex.count
        case 2:
            return 100
        default:
            return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return sex[row]
        case 2:
            return String(row + 1)
        default:
            return ""
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            personInfoView.genderTextField.text! = sex[row]
        case 2:
            personInfoView.ageTextField.text! = String(row + 1)
        default:
            break
        }
    }
}
