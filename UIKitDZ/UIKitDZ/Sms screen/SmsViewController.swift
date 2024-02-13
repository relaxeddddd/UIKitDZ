// SmsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс для отображения экрана ввода смс
final class SmsViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addBarItems()
        addViews()
        addTargets()
    }

    // MARK: - Private Methods

    // Добавление view's на экран
    private func addViews() {
        view.addSubview(smsView.textLabel)
        view.addSubview(smsView.smsTextField)
        view.addSubview(smsView.sendAgainButton)
        view.addSubview(smsView.acceptButton)
    }

    // Добавление таргетов
    private func addTargets() {
        smsView.smsTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }

    // Настройка бар айтемов
    private func addBarItems() {
        title = "Кодъ из СМС"

        let barButtonLeft = UIButton()
        barButtonLeft.setImage(UIImage(named: "rowBack"), for: .normal)
        barButtonLeft.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: barButtonLeft)
        view.addSubview(smsView)
    }

    // Закрытие окна смс
    @objc private func closeScreen() {
        dismiss(animated: true)
    }

    // Проверка на заполненость TF с кодом и изменение состояния кнопки
    @objc private func textFieldDidChange(textField: UITextField) {
        if let text = smsView.smsTextField.text {
            if !text.isEmpty {
                smsView.acceptButton.isEnabled = true
                smsView.acceptButton.backgroundColor = UIColor.costumEnableBlue
            } else {
                smsView.acceptButton.isEnabled = false
                smsView.acceptButton.backgroundColor = UIColor.costumNotenableBlue
            }
        }
    }

    // MARK: - Constants

    let smsView = SmsViewViewController()
}
