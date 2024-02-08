// CostumView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс CostumView
class CostumView: UIView {
    // MARK: - Public Properties
    var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1.0)
        button.frame = CGRect(
            x: 19,
            y: (UIScreen.main.bounds.height) / 2,
            width: (UIScreen.main.bounds.width) - 40,
            height: 44
        )
        button.layer.cornerRadius = 12
        return button
    }()

    var wordTitleLabelOne: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(
            x: 25,
            y: 100,
            width: (UIScreen.main.bounds.width) - 40,
            height: 44
        )
        label.isHidden = true
        return label
    }()

    var wordTitleLabelTwo: UILabel = {
        let label = UILabel()
        label.text = "А вот что получится, если\n читать справа налево"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(
            x: 25,
            y: 300,
            width: (UIScreen.main.bounds.width) - 40,
            height: 44
        )
        label.isHidden = true
        return label
    }()

    var oldWord: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.2)
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Italic", size: 16)
        label.frame = CGRect(
            x: 25,
            y: 160,
            width: (UIScreen.main.bounds.width) - 40,
            height: 44
        )
        return label
    }()

    var newWord: UILabel = {
        var label = UILabel()
        label.textColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.2)
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Italic", size: 16)
        label.frame = CGRect(
            x: 25,
            y: 370,
            width: (UIScreen.main.bounds.width) - 40,
            height: 44
        )
        return label
    }()
}
