// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class OrderViewController: UIViewController {
    let orderView = OrderViewViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        addTargets()
    }

    private func addViews() {
        view.addSubview(orderView.closeButton)
        view.addSubview(orderView.enterButton)
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

    private func addTargets() {
        orderView.closeButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }
}
