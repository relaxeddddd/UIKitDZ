// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ViewController
class ViewController: UIViewController {
    // MARK: - Public Properties

    let myView = CostumView()
    let model = CalculationModel()

    // MARK: - Override Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground(nameImage: "backgroundImage")
        view.addSubview(myView.helloTextLabel)
        view.addSubview(myView.guessTheNumberButton)
        myView.guessTheNumberButton.addTarget(self, action: #selector(guessTheNumber), for: .allEvents)
        view.addSubview(myView.calculationButton)
        myView.calculationButton.addTarget(self, action: #selector(calculation), for: .allEvents)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printYourName(title: "Пожалуйста, представьтесь", message: nil, style: .alert)
    }

    // MARK: - Public methods

    // Showing alertness when calculating numbers
    func showAlertOfGuessNumber(title: String, message: String, style: UIAlertController.Style) {
        let alertControllerLose = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        alertControllerLose.addAction(UIAlertAction(title: "Oк", style: .default))
        alertControllerLose.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alertControllerLose, animated: true)
    }

    // Function for displaying an alert when performing mathematical operations
    func showAlertOfResultCalculation(titel: String, message: String, style: UIAlertController.Style) {
        let additionAlertController = UIAlertController(
            title: titel,
            message: message,
            preferredStyle: style
        )
        additionAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        additionAlertController.addAction(UIAlertAction(title: "Oк", style: .default))
        present(additionAlertController, animated: true)
    }

    // Function for setting the background
    func addBackground(nameImage: String) {
        let backgroundImage = UIImageView(image: UIImage(named: nameImage))
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)
    }

    // Alert function to enter a name
    func printYourName(title: String, message: String?, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }
        let action = UIAlertAction(title: "Готово", style: .cancel) { _ in
            self.myView.helloTextLabel.text? += alertController.textFields?.first?.text ?? "nil"
            self.myView.helloTextLabel.isHidden = false
        }
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    // MARK: - Private methods

    // Number guessing function
    @objc private func guessTheNumber() {
        let alertController = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        alertController.addTextField { textFeild in
            textFeild.placeholder = "Введите число"
        }
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { _ in
            let number = Int(alertController.textFields?.first?.text ?? "nil")
            let randomNumber = self.model.randomNumber
            if number ?? 0 > randomNumber {
                self.showAlertOfGuessNumber(
                    title: "Попробуй ещё раз",
                    message: "Вы ввели слишком большое число",
                    style: .alert
                )

            } else if number ?? 0 < randomNumber {
                self.showAlertOfGuessNumber(
                    title: "Попробуй ещё раз",
                    message: "Вы ввели слишком маленькое число",
                    style: .alert
                )

            } else {
                let alertControllerWin = UIAlertController(
                    title: "Поздравляю!",
                    message: "Вы угадали",
                    preferredStyle: .alert
                )
                alertControllerWin.addAction(UIAlertAction(title: "Oк", style: .cancel))
                self.present(alertControllerWin, animated: true)
            }

        })
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alertController, animated: true)
    }

    // Calculator functionality
    @objc private func calculation() {
        let alertControllerMain = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        alertControllerMain.addTextField { textField in
            textField.placeholder = "Число 1"
        }

        alertControllerMain.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        alertControllerMain.addAction(UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            guard let numberOneString = alertControllerMain.textFields?.first?.text,
                  let oneNumber = Double(numberOneString) else { return }

            guard let numberTwoString = alertControllerMain.textFields?.last?.text,
                  let twoNumber = Double(numberTwoString) else { return }

            let operationAlertController = UIAlertController(
                title: "Выбирите математическую операцию",
                message: nil,
                preferredStyle: .alert
            )

            operationAlertController.addAction(UIAlertAction(title: "Сложить", style: .default) { _ in
                self.showAlertOfResultCalculation(
                    titel: "Ваш результат",
                    message: String(self.model.additionNumbers(oneNumber, twoNumber)),
                    style: .alert
                )
            })
            operationAlertController.addAction(UIAlertAction(title: "Вычислить", style: .default) { _ in
                self.showAlertOfResultCalculation(
                    titel: "Ваш результат",
                    message: String(self.model.subtractNumbers(oneNumber, twoNumber)),
                    style: .alert
                )
            })
            operationAlertController.addAction(UIAlertAction(title: "Умножить", style: .default) { _ in
                self.showAlertOfResultCalculation(
                    titel: "Ваш результат",
                    message: String(self.model.multiplicationNumbers(oneNumber, twoNumber)),
                    style: .alert
                )
            })
            operationAlertController.addAction(UIAlertAction(title: "Разделить", style: .default) { _ in
                self.showAlertOfResultCalculation(
                    titel: "Ваш результат",
                    message: String(self.model.dividingNumbers(oneNumber, twoNumber) ?? 0),
                    style: .alert
                )
            })
            operationAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
            self.present(operationAlertController, animated: true)
        })

        alertControllerMain.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alertControllerMain, animated: true)
    }
}
