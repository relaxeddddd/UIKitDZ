// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс CheckViewController для отображения экрана с чеком и переходом на экран с благодарностью
final class CheckViewController: UIViewController {
    // MARK: - Override Mothods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - IB Actions

    // Функционал нажатия на кнопку "Итог"
    @IBAction func checkButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Вы хотите оплатить чек?", message: nil, preferredStyle: .alert)
        let actionCancle = UIAlertAction(title: "Отмена", style: .default)
        let actionCheck = UIAlertAction(title: "Да", style: .default) { _ in
            let checkVC = self.storyboard?.instantiateViewController(withIdentifier: "thaksStoryboadID")
            self.present(checkVC!, animated: true, completion: nil)
        }
        alertController.addAction(actionCancle)
        alertController.addAction(actionCheck)
        alertController.preferredAction = actionCheck
        present(alertController, animated: true)
    }
}
