// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Показ экрана ингредиентов
final class IngredientsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let prices = [50, 20, 50, 70, 50]
    }

    // MARK: - Public Properties

    var ingredientsView = IngredientsView()
    var getPriceHandler: ((String) -> Void)?

    // MARK: - Lyfe Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        addConfigNameFood()
    }

    // MARK: - Private Methods

    private func addViews() {
        view.addSubview(ingredientsView.closeButton)
        ingredientsView.closeButton.addTarget(self, action: #selector(setNewPrice), for: .touchUpInside)
        view.addSubview(ingredientsView.titleLabel)
        view.addSubview(ingredientsView.milkSwitch)
        view.addSubview(ingredientsView.milkLabel)
        view.addSubview(ingredientsView.siropSwitch)
        view.addSubview(ingredientsView.siropLabel)
        view.addSubview(ingredientsView.milkSoyaSwitch)
        view.addSubview(ingredientsView.milkSoyaLabel)
        view.addSubview(ingredientsView.milkMindalSwitch)
        view.addSubview(ingredientsView.milkMindalLabel)
        view.addSubview(ingredientsView.espressoSwitch)
        view.addSubview(ingredientsView.espressoLabel)
    }

    /// Обновление ценника в зависимости от нажатого switch
    @objc private func setNewPrice() {
        var sum = 0
        for (index, element) in ingredientsView.switches.enumerated() where element.isOn {
            sum += Constants.prices[index]
        }
        let newPrice = "Цѣна - \(sum + 100) руб"
        getPriceHandler?(newPrice)
        dismiss(animated: true)
    }

    /// Функция для добавления текста с определенным цветом к нашим Label
    private func configNamedFood(nameLabel: UILabel, price: String) {
        let price = NSAttributedString(
            string: price,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        )
        let allText = NSMutableAttributedString(string: nameLabel.text ?? "nil")
        allText.append(price)
        nameLabel.attributedText = allText
    }

    private func addConfigNameFood() {
        configNamedFood(nameLabel: ingredientsView.milkLabel, price: "+50 руб")
        configNamedFood(nameLabel: ingredientsView.siropLabel, price: "+20 руб")
        configNamedFood(nameLabel: ingredientsView.milkSoyaLabel, price: "+50 руб")
        configNamedFood(nameLabel: ingredientsView.milkMindalLabel, price: "+70 руб")
        configNamedFood(nameLabel: ingredientsView.espressoLabel, price: "+50 руб")
    }
}
