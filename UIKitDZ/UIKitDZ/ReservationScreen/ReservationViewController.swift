// ReservationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ReservationViewController: UIViewController {
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var numberOfGuestsTextField: UITextField!
    @IBOutlet var numberOfTabelTextField: UITextField!

    @IBAction func button(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счёт?", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Отмена", style: .default))
        alertController.addAction(UIAlertAction(title: "Чек", style: .cancel) { _ in
            self.performSegue(withIdentifier: "checkSegue", sender: nil)
        })
        present(alertController, animated: true)
    }
}
