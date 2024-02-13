// OrderViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class OrderViewViewController: UIView {
    let chooseCoffee = ChooseCoffeeViewViewController()
    public let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        return button
    }()

    let flowersLeftImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "leftFlowers")
        image.frame = CGRect(x: 20, y: 47, width: 100, height: 73)
        return image
    }()

    let flowersRightImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rightFlowers")
        image.frame = CGRect(x: 260, y: 47, width: 100, height: 73)
        return image
    }()

    let flowersMidleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "midleFlowers")
        image.frame = CGRect(x: 137, y: 472, width: 100, height: 40)
        return image
    }()

    let titleOrderLabel: UILabel = {
        let label = UILabel()
        label.text = "Вашъ Заказъ"
        label.font = UIFont.verdana18
        label.frame = CGRect(x: 120, y: 100, width: 140, height: 30)
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "nil"
        label.font = UIFont.verdana18
        label.textAlignment = .center
        label.frame = CGRect(x: 80, y: 433, width: 231, height: 30)
        return label
    }()

    // Кофе
    let coffeeLabel: UILabel = {
        let label = UILabel()
        label.text = "Американо"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 155, width: 150, height: 30)
        return label
    }()

    let coffeePriceLabel: UILabel = {
        let label = UILabel()
        label.text = "100 руб"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textAlignment = .right
        label.frame = CGRect(x: 225, y: 155, width: 130, height: 30)
        return label
    }()

    // Молоко
    let milkLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко"
        label.frame = CGRect(x: 20, y: 191, width: 150, height: 30)
        return label
    }()

    let milkPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "50 руб"
        label.textAlignment = .right
        label.frame = CGRect(x: 225, y: 191, width: 130, height: 30)
        return label
    }()

    // Эспрессо
    let espressoLabel: UILabel = {
        let label = UILabel()
        label.text = "Эспрессо 50мл"
        label.frame = CGRect(x: 20, y: 227, width: 150, height: 30)
        return label
    }()

    let espressoPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "50 руб"
        label.textAlignment = .right
        label.frame = CGRect(x: 225, y: 227, width: 130, height: 30)
        return label
    }()

    public let enterButton = CustomButton(frame: CGRect(x: 15, y: 632, width: 345, height: 53), text: "Оплатить")
}
