// SizeView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения view's  на экране выбора размера
final class SizeView: UIView {
    // MARK: - Visual Components

    let backgrounUiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.layer.cornerRadius = 20
        uiView.layer.shadowColor = UIColor.black.cgColor
        uiView.layer.shadowOpacity = 0.5
        uiView.layer.shadowOffset = CGSize(width: 0, height: 4)
        uiView.layer.shadowRadius = 10
        return uiView
    }()

    let title: UILabel = {
        let label = UILabel()
        label.text = "Размер ноги"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 225 / 255, green: 24 / 255, blue: 131 / 255, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.setTitle("Сохранить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgrounUiView)
        addSubview(title)
        addSubview(saveButton)
        addSubview(closeButton)
        setupSizeBackground()
        setupTitle()
        setupSaveButton()
        setupClosebutton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(backgrounUiView)
        addSubview(title)
        addSubview(saveButton)
        addSubview(closeButton)
        setupSizeBackground()
        setupTitle()
        setupSaveButton()
        setupClosebutton()
    }

    private func setupSizeBackground() {
        backgrounUiView.topAnchor.constraint(equalTo: topAnchor, constant: 512).isActive = true
        backgrounUiView.heightAnchor.constraint(equalToConstant: 283).isActive = true
        backgrounUiView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        backgrounUiView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }

    private func setupTitle() {
        title.centerXAnchor.constraint(equalTo: backgrounUiView.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: backgrounUiView.topAnchor, constant: 15).isActive = true
    }

    private func setupSaveButton() {
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: backgrounUiView.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 170).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }

    private func setupClosebutton() {
        closeButton.trailingAnchor.constraint(equalTo: backgrounUiView.trailingAnchor, constant: -19).isActive = true
        closeButton.topAnchor.constraint(equalTo: backgrounUiView.topAnchor, constant: 15).isActive = true
    }
}
