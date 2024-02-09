// ReservationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ReservationViewController для ототбражения экрана с заполнением критериев посетителя
final class ReservationViewController: UIViewController {
    // MARK: - IB Outlets

    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var numberOfGuestsTextField: UITextField!
    @IBOutlet var numberOfTabelTextField: UITextField!

    // MARK: - Override Mothods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - IB Actions

    // Функционал нажатия на кнопку "Выставить счёт"
    @IBAction func button(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счёт?", message: nil, preferredStyle: .alert)
        let actionCancle = UIAlertAction(title: "Отмена", style: .default)
        let actionCheck = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "checkSegue", sender: nil)
        }
        alertController.addAction(actionCancle)
        alertController.addAction(actionCheck)
        alertController.preferredAction = actionCheck
        present(alertController, animated: true)
    }
}
