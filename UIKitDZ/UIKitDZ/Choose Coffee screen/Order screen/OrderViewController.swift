// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс OrderViewController для отображения экрана с чеом
final class OrderViewController: UIViewController {
    // MARK: - Public Properties

    var orderView = OrderView()
    var nextScreenHandler: (() -> Void)?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
    }

    // MARK: - Private Methods

    /// Добавление view's на наш экран
    private func addViews() {
        view.addSubview(orderView.closeButton)
        orderView.closeButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        view.addSubview(orderView.enterButton)
        orderView.enterButton.addTarget(self, action: #selector(goToSmsViewController), for: .touchUpInside)
        view.addSubview(orderView.flowersLeftImage)
        view.addSubview(orderView.flowersRightImage)
        view.addSubview(orderView.flowersMidleImage)
        view.addSubview(orderView.titleOrderLabel)

        view.addSubview(orderView.coffeeLabel)
        view.addSubview(orderView.coffeePriceLabel)

        view.addSubview(orderView.milkLabel)
        view.addSubview(orderView.milkPriceLabel)

        view.addSubview(orderView.espressoLabel)
        view.addSubview(orderView.espressoPriceLabel)

        view.addSubview(orderView.priceLabel)
    }

    /// Закрытие экрана
    @objc private func closeScreen() {
        dismiss(animated: true) {}
    }

    @objc private func goToSmsViewController() {
        dismiss(animated: true) {
            self.nextScreenHandler?()
        }
    }
}
