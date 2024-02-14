// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ViewController
class CatalogViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setDefaultBackgroundColor()
        setupBarButton()
    }
    
    private func setupBarButton() {
        navigationItem.title = "Каталог"
    }
}
