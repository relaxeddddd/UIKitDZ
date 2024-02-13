// ThanksScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ThanksScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // кнопка закрыть
        let xButton = UIButton(frame: CGRect(x: 27, y: 40, width: 14, height: 14))
        xButton.setImage(UIImage(named: "xImage"), for: .normal)
        view.addSubview(xButton)
        // лого цветы
        let flowers = UIImageView(frame: CGRect(x: 92, y: 58, width: 200, height: 87))
        flowers.image = UIImage(named: "flowersImage")
        view.addSubview(flowers)
        // лого спасибо
        let thankYou = UIImageView(frame: CGRect(x: 75, y: 184, width: 225, height: 128))
        thankYou.image = UIImage(named: "thankImage")
        view.addSubview(thankYou)
        // текст
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: 35, y: 362, width: 315, height: 89)
        textLabel.text =
            "Разскажи о насъ другу, отправь ему\n" +
            "промокодъ\n" +
            "на безплатный напитокъ и получи\n" +
            "скидку 10% на слѣдующій заказъ."
        textLabel.numberOfLines = 4
        textLabel.textColor = .lightGray
        textLabel.font = UIFont(name: "Verdana", size: 16)
        view.addSubview(textLabel)
        // кнопка хорошо
        let goodButton = UIButton(frame: CGRect(x: 15, y: 648, width: 345, height: 53))
        goodButton.layer.cornerRadius = 12
        goodButton.backgroundColor = UIColor(named: "newTurquoise")
        goodButton.setTitle("Хорошо", for: .normal)
        goodButton.setTitleColor(.white, for: .normal)
        goodButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        goodButton.contentHorizontalAlignment = .center
        view.addSubview(goodButton)
    }
}
