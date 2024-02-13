// ChooseCoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ChooseCoffeeViewController отвечающий за показ экрана с меню кофе
final class ChooseCoffeeViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        settingBarButton()
        addTarget()
        addViews()
    }

    // MARK: - Private Methods

    private func settingBarButton() {
        // Создаем кнопку назад
        let backButton = UIButton()
        backButton.backgroundColor = UIColor(red: 235 / 255, green: 246 / 255, blue: 247 / 255, alpha: 1.0)
        backButton.layer.cornerRadius = 44 / 2
        backButton.setImage(UIImage(named: "rowBack"), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)

        // Создаем кнопку поделиться
        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        shareButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        shareButton.addTarget(self, action: #selector(shareToTelegram), for: .touchUpInside)
        let shareBarButtonItem = UIBarButtonItem(customView: shareButton)

        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.rightBarButtonItem = shareBarButtonItem
    }

    private func addTarget() {
        chooseView.segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        chooseView.ingredientsButton.addTarget(self, action: #selector(goToIngredientsScreen), for: .touchUpInside)
        chooseView.enterButton.addTarget(self, action: #selector(goToOrderScreen), for: .touchUpInside)
    }

    private func addViews() {
        view.addSubview(chooseView.uiView)
        view.addSubview(chooseView.imageCoffee)
        view.addSubview(chooseView.segmentControl)
        view.addSubview(chooseView.modificationLabel)
        view.addSubview(chooseView.coffeeBeansButton)
        view.addSubview(chooseView.beansImage)
        view.addSubview(chooseView.beansLabel)
        view.addSubview(chooseView.ingredientsButton)
        view.addSubview(chooseView.ingredientsLabel)
        view.addSubview(chooseView.pluseImage)
        view.addSubview(chooseView.priceLabel)
        view.addSubview(chooseView.enterButton)
    }

    @objc private func selectedValue(sender: UISegmentedControl) {
        if sender == chooseView.segmentControl {
            let segmentIndex = sender.selectedSegmentIndex
            chooseView.imageCoffee.image = segmentImages[segmentIndex]
        }
    }

    @objc private func goBackViewController() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func goToIngredientsScreen() {
        let ingredientsController = IngredientsViewController()
        ingredientsController.summaUp = { newOrder in
            self.chooseView.priceLabel.text = newOrder
            if newOrder == "Цѣна - 100 руб" {
                self.chooseView.pluseImage.image = UIImage(named: "pluse")
            } else {
                self.chooseView.pluseImage.image = UIImage(named: "checkMark")
            }
        }
        present(ingredientsController, animated: true)
    }

    // При нажатии на кнопку с переходом в Order у нас при закрытие ордера вызывается делегат с помощью которого пушится
    // Sms screen
    @objc private func goToOrderScreen() {
        let orderController = OrderViewController()
        orderController.push = {
            let smsController = SmsViewController()
            self.navigationController?.pushViewController(smsController, animated: true)
        }
        orderController.orderView.priceLabel.text = chooseView.priceLabel.text
        present(orderController, animated: true)
    }

    // Метод что б поделиться смс
    @objc private func shareToTelegram() {
        let message = "Лови промокод roadmaplove на любой напиток из Кофейнов"
        let activityViewController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        present(activityViewController, animated: true)
    }

    // MARK: - Constants

    let chooseView = ChooseCoffeeViewViewController()
    let segmentImages = [UIImage(named: "simpleCoffee"), UIImage(named: "capuchino"), UIImage(named: "latte")]
}
