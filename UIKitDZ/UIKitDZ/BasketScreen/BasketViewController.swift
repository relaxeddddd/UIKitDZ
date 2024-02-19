// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения экрана корзины
class BasketViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let startCoordiensateY = 116
        static let updateCoordinateY = 180
        static let startSum = 0
    }

    // MARK: - Visual Components

    private var orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ - ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 225 / 255, green: 24 / 255, blue: 131 / 255, alpha: 1.0)
        button.isHidden = true
        return button
    }()

    // MARK: - Public Properties

    var sumPrice = Constants.startSum

    var shouses = [ShooseModel]() {
        didSet {
            addShouse()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupBarButton()
        view.addSubview(orderButton)
    }

    // MARK: - Private Methods

    private func setupBarButton() {
        navigationItem.title = "Корзина"
    }

    private func createBlock(shouse: ShooseModel, coordinateY: Int) {
        let basketView = BasketView()
        basketView.imageShoose.image = shouse.shooseImg
        basketView.sumPrice.text = shouse.shoosePrice
        orderButton.isHidden = false

        orderButton.isHidden = false

        view.addSubview(basketView)
        basketView.translatesAutoresizingMaskIntoConstraints = false
        basketView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        basketView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(coordinateY)).isActive = true
        basketView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        orderButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27).isActive = true
        orderButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    // Обновление цены в кнопке
    func updateTotalPrice() {
        sumPrice = Constants.startSum
        for shouse in shouses {
            if let price = Int(shouse.shoosePrice) {
                sumPrice += price
            }
        }
        orderButton.setTitle("Оформить заказ - \(sumPrice) Р", for: .normal)
    }

    // Добавление объектов экземпляра модели в массив
    private func addShouse() {
        var coordinateY = Constants.startCoordiensateY
        for shouse in shouses {
            createBlock(shouse: shouse, coordinateY: coordinateY)
            coordinateY += Constants.updateCoordinateY
        }
        updateTotalPrice()
    }
}

extension BasketViewController: ShoesViewControllerDelegate {
    func transitInformation(shouse: ShooseModel) {
        shouses.append(shouse)
    }
}
