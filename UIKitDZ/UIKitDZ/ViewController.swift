// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ViewController
class ViewController: UIViewController {
    // MARK: - Public Properties
    let myView = CostumView()

    // MARK: - Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView.wordTitleLabelOne)
        view.addSubview(myView.wordTitleLabelTwo)
        view.addSubview(myView.oldWord)
        view.addSubview(myView.newWord)
        view.addSubview(myView.startButton)
        myView.startButton.addTarget(self, action: #selector(showWordAlert), for: .allEvents)
        view.backgroundColor = .white
    }

    // MARK: - Private Methods
    // Show alert befor tapped button
    @objc private func showWordAlert() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { _ in
            self.myView.startButton.frame = CGRect(
                x: 19,
                y: 650,
                width: (UIScreen.main.bounds.width) - 40,
                height: 44
            )
            self.myView.wordTitleLabelOne.isHidden = false
            self.myView.oldWord.text = alertController.textFields?.first?.text?.capitalized ?? "Нет слова"
            self.myView.wordTitleLabelTwo.isHidden = false
            guard let word = alertController.textFields?.first?.text else { return }
            let revesedWord = String(word.reversed())
            self.myView.newWord.text = revesedWord.capitalized
        })
        present(alertController, animated: true)
    }
}
