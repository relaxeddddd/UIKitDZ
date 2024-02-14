// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class BasketViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupBarButton()
    }

    private func setupBarButton() {
        navigationItem.title = "Корзина"
    }
}
