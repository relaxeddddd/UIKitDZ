// ThanksViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ThanksViewController для отображения экрана благодарности
final class ThanksViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var thabksLabel: UILabel!

    // MARK: - Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        thabksLabel.text? += UserInfo.shared.login ?? ""
    }

    // MARK: - IB Outlets

    // Скрытие ThanksViewController
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
        view.backgroundColor = .white
    }
}
