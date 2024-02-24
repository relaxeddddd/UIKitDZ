// ThanksScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
//Последний контроллер Спасибо за заказ
final class ThanksScreenViewController: UIViewController {
    // MARK: - Visual Component

    // кнопка закрыть
    lazy var xButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 27, y: 40, width: 14, height: 14))
        button.setImage(UIImage(named: "xImage"), for: .normal)
        return button
    }()

    // лого цветы
    lazy var flowersImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 92, y: 58, width: 200, height: 87))
        imageView.image = UIImage(named: "flowersImage")
        return imageView
    }()

    // лого спасибо
    lazy var thankYouImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 75, y: 184, width: 225, height: 128))
        imageView.image = UIImage(named: "thankImage")
        return imageView
    }()

    // текст
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 35, y: 362, width: 315, height: 89)
        label.text =
            "Разскажи о насъ другу, отправь ему\n" +
            "промокодъ\n" +
            "на безплатный напитокъ и получи\n" +
            "скидку 10% на слѣдующій заказъ."
        label.numberOfLines = 4
        label.textColor = .lightGray
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

    // кнопка хорошо
    lazy var goodButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 648, width: 345, height: 53))
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "newTurquoise")
        button.setTitle("Хорошо", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(goodButtonTapped), for: .touchUpInside)
        return button
    }()

    func setupViews() {
        view.addSubview(xButton)
        view.addSubview(flowersImageView)
        view.addSubview(thankYouImageView)
        view.addSubview(textLabel)
        view.addSubview(goodButton)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }

    // MARK: - Button Action

    // обработчик кнопки для возврата на экран меню
    @objc func goodButtonTapped() {
        // let menuVC = MenuViewController()

        navigationController?.popToRootViewController(animated: true)
        // navigationController?.pushViewController(menuVC, animated: true)
    }
}
