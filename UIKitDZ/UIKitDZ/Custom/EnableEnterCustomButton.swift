// EnableEnterCustomButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Кастомная кнопка входа
final class EnableEnterCustomButton: UIButton {
    // MARK: Initializers

    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        setTitle(text, for: .normal)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    // MARK: - Private Methods

    private func setupButton() {
        backgroundColor = UIColor(red: 89 / 255, green: 190 / 255, blue: 199 / 255, alpha: 1.0)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.verdana18
        layer.cornerRadius = 12
    }
}
