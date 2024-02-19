// CustomTextFieldFromDetalis.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Кастомный текст фильд для введиния данных
final class CustomTextFieldFromDetalis: UITextField {
    // MARK: Initializers

    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setupTextField()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextField()
    }

    // MARK: - Private Methods

    private func setupTextField() {
        layer.cornerRadius = 12
        backgroundColor = UIColor(red: 248 / 255, green: 248 / 255, blue: 248 / 255, alpha: 1.0)
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        leftViewMode = .always
        leftView = spacerView
        translatesAutoresizingMaskIntoConstraints = false
    }
}
