// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс для отображение модельного окна с выбором ингридиентов
class IngredientsViewController: UIViewController {
    // MARK: - Public Properties

    /// Замыкание для передачи данных(в нашем случае обновленной цены)
    var summaUp: ((String) -> Void)?

    // MARK: - Lyfe Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        addTarget()
        configNamedFood(nameLabel: ingredientsView.milkLabel, price: "+50 руб")
    }

    // MARK: - Private Properties

    /// Добавление наших view's на экран
    private func addViews() {
        view.addSubview(ingredientsView.closeButton)
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

    private func configNamedFood(nameLabel: UILabel, price: String) {
        let price = NSAttributedString(
            string: price,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        )
        let allText = NSMutableAttributedString(string: nameLabel.text ?? "nil")
        allText.append(price)
        nameLabel.attributedText = allText
    }

    /// Добавление target's действий
    private func addTarget() {
        ingredientsView.closeButton.addTarget(self, action: #selector(setNewPrice), for: .touchUpInside)
    }

    /// Обновление ценника в зависимости от нажатого switch
    @objc private func setNewPrice() {
        var sum = 0
        for (index, element) in ingredientsView.switches.enumerated() {
            if element.isOn {
                sum += prices[index]
            }
        }
        let newPrice = "Цѣна - \(sum + 100) руб"
        summaUp?(newPrice)
        dismiss(animated: true)
    }

    // MARK: - Contants

    let prices = [50, 20, 50, 70, 50]
    let ingredientsView = IngredientsViewViewController()
}
