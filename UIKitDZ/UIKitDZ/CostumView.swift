// CostumView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс CostumView
class CostumView: UIView {
    // MARK: - Public Properties

    var helloTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Приветствую,\n"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 229 / 255, alpha: 1.0)
        label.frame = CGRect(x: 0, y: 32, width: UIScreen.main.bounds.width, height: 102)
        label.isHidden = true
        return label
    }()

    var guessTheNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 155 / 255, green: 127 / 255, blue: 181 / 255, alpha: 1.0)
        button.frame = CGRect(x: 85, y: 300, width: 150, height: 150)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(red: 143 / 255, green: 74 / 255, blue: 222 / 255, alpha: 1.0).cgColor
        button.layer.borderWidth = 2
        button.clipsToBounds = true
        return button
    }()

    var calculationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 100 / 255, green: 181 / 255, blue: 130 / 255, alpha: 1.0)
        button.frame = CGRect(x: 130, y: 500, width: 200, height: 200)
        button.layer.cornerRadius = 20
        button.layer.borderColor = UIColor(red: 0 / 255, green: 102 / 255, blue: 51 / 255, alpha: 1.0).cgColor
        button.layer.borderWidth = 2
        button.clipsToBounds = true
        return button
    }()
}
