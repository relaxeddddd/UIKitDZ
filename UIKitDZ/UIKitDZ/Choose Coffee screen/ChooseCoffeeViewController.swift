// ChooseCoffeeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с меню кофе
final class ChooseCoffeeViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let segmentImages = [
            UIImage(named: "simpleCoffee"),
            UIImage(named: "cappucchino"),
            UIImage(named: "latte")
        ]
        static let price = "Цѣна - 100 руб"
        static let telegramMessage = "Лови промокод roadmaplove на любой напиток из Кофейнов"
    }

    // MARK: - Private Properties

    private var chooseView = ChooseCoffeeView()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButton()
        addViews()
    }

    // MARK: - Private Methods

    private func setupBarButton() {
        let backButton = UIButton()
        backButton.backgroundColor = UIColor(red: 235 / 255, green: 246 / 255, blue: 247 / 255, alpha: 1.0)
        backButton.layer.cornerRadius = 44 / 2
        backButton.setImage(UIImage(named: "rowBack"), for: .normal)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.addTarget(self, action: #selector(goBackViewController), for: .touchUpInside)
        let backBarButtonItem = UIBarButtonItem(customView: backButton)

        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        shareButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        shareButton.addTarget(self, action: #selector(shareToTelegram), for: .touchUpInside)
        let shareBarButtonItem = UIBarButtonItem(customView: shareButton)

        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.rightBarButtonItem = shareBarButtonItem
    }

    private func addViews() {
        view.backgroundColor = .white
        view.addSubview(chooseView.uiViewBackground)
        view.addSubview(chooseView.imageCoffee)
        view.addSubview(chooseView.segmentControl)
        chooseView.segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        view.addSubview(chooseView.modificationLabel)
        view.addSubview(chooseView.coffeeBeansButton)
//        chooseView.coffeeBeansButton.addTarget(self, action: #selector(gotoCoffeeBeansScreen), for: .touchUpInside)
        view.addSubview(chooseView.beansImageView)
        view.addSubview(chooseView.beansLabel)
        view.addSubview(chooseView.ingredientsButton)
        chooseView.ingredientsButton.addTarget(self, action: #selector(goToIngredientsScreen), for: .touchUpInside)
        view.addSubview(chooseView.ingredientsLabel)
        view.addSubview(chooseView.pluseImage)
        view.addSubview(chooseView.priceLabel)
        view.addSubview(chooseView.enterButton)
        chooseView.enterButton.addTarget(self, action: #selector(goToOrderScreen), for: .touchUpInside)
    }

    // Меняем картинки в сегмент контроллере
    @objc private func selectedValue(sender: UISegmentedControl) {
        if sender == chooseView.segmentControl {
            let segmentIndex = sender.selectedSegmentIndex
            chooseView.imageCoffee.image = Constants.segmentImages[segmentIndex]
        }
    }

    @objc private func goBackViewController() {
        let menuController = MenuViewController()
        navigationController?.popToViewController(menuController, animated: true)
    }

    // Переход на экран с зернами
//    @objc private func gotoCoffeeBeansScreen() {
//        let coffeeBeansController = CoffeeBeansController()
//        present(coffeeBeansController, animated: true)
//    }

    // Переход на экран ингредиентов и перенос цены в Order Screen
    @objc private func goToIngredientsScreen() {
        let ingredientsController = IngredientsViewController()
        ingredientsController.getPriceHandler = { [weak self] newOrder in
            self?.chooseView.priceLabel.text = newOrder
            if newOrder == Constants.price {
                self?.chooseView.pluseImage.image = UIImage(named: "pluse")
            } else {
                self?.chooseView.pluseImage.image = UIImage(named: "checkMark")
            }
        }
        present(ingredientsController, animated: true)
    }

    // При нажатии на кнопку с переходом в Order у нас при закрытие ордера вызывается делегат с помощью которого пушится
    @objc private func goToOrderScreen() {
        let orderController = OrderViewController()
        orderController.nextScreenHandler = { [weak self] in
            let smsController = SmsViewController()
            self?.navigationController?.pushViewController(smsController, animated: true)
        }
        orderController.orderView.priceLabel.text = chooseView.priceLabel.text
        present(orderController, animated: true)
    }

    @objc private func shareToTelegram() {
        let message = Constants.telegramMessage
        let activityViewController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}

protocol SelectionRoastCoffeDelegate: AnyObject {
     func sendTheImage(_ image: UIImage)
     func sendTheText(_ text: String)
 }

 class ChooseCoffeeViewController: UIViewController {
     override func viewDidLoad() {
         super.viewDidLoad()
         print("Choose Coffee VC")
         view.backgroundColor = .blue
     }
 }
