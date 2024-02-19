// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Отображения экрана профиля
final class ProfileViewController: UIViewController {
    // MARK: - Private Properties

    private var profileView = ProfileView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.setDefaultBackgroundColor()
        setupTitle()
        addTarget()
    }

    override func loadView() {
        super.loadView()
        view = profileView
    }

    // MARK: - Private Methods

    private func setupTitle() {
        navigationItem.title = "Профиль"
    }

    private func addTarget() {
        profileView.myDataButton.addTarget(self, action: #selector(goToDetailsScreen), for: .touchUpInside)
    }

    @objc private func goToDetailsScreen() {
        let detalisController = MyDetailsViewController()
        detalisController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detalisController, animated: true)
    }
}
