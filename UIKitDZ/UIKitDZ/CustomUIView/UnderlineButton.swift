// UnderlineButton.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

// Кастомный UnderlineButton
final class UnderlineButton: UIView {
    // MARK: Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUnderline()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUnderline()
    }

    // MARK: - Private Methods

    private func setupUnderline() {
        backgroundColor = .lightGray
        translatesAutoresizingMaskIntoConstraints = false
    }
}
