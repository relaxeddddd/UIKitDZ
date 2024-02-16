// BasketView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// добавление view's на экран корзины
class BasketView: UIView {
    let backbroundImageUiView: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 248 / 255, green: 248 / 255, blue: 248 / 255, alpha: 1.0)
        background.layer.cornerRadius = 20
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()

    let cartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let imageShoose: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Женские ботинки"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let quantily: UILabel = {
        let label = UILabel()
        label.text = "Количество"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Размер"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let pluseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = UIColor(red: 250 / 255, green: 235 / 255, blue: 244 / 255, alpha: 1.0)
        button.layer.cornerRadius = 7.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = UIColor(red: 250 / 255, green: 235 / 255, blue: 244 / 255, alpha: 1.0)
        button.layer.cornerRadius = 7.5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let quantilyShoes: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let sizeButton36: UIButton = {
        let button = UIButton()
        button.setTitle("36", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let sizeButton37: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("37", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let sizeButton38: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("38", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let sizeButton39: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("39", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let sizeButton40: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setTitle("40", for: .normal)
        button.layer.cornerRadius = 13
        button.backgroundColor = UIColor(red: 250 / 255, green: 235 / 255, blue: 244 / 255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let sumPrice: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    init(image: UIImage? = nil) {
        super.init(frame: .zero)
        imageShoose.image = image
        addSubview(backbroundImageUiView)
        addSubview(imageShoose)
        addSubview(titleLabel)
        addSubview(titleLabel)
        addSubview(quantily)
        addSubview(sizeLabel)
        addSubview(priceLabel)
        addSubview(pluseButton)
        addSubview(minusButton)
        addSubview(quantilyShoes)
        addSubview(sizeButton40)
        addSubview(cartButton)
        addSubview(sumPrice)
        setupViews()
        setupSizeButtons()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupViews() {
        backbroundImageUiView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        backbroundImageUiView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backbroundImageUiView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        backbroundImageUiView.heightAnchor.constraint(equalToConstant: 157).isActive = true

        imageShoose.leadingAnchor.constraint(equalTo: backbroundImageUiView.leadingAnchor, constant: 28).isActive = true
        imageShoose.trailingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: -28)
            .isActive = true
        imageShoose.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 28).isActive = true
        imageShoose.bottomAnchor.constraint(equalTo: backbroundImageUiView.bottomAnchor, constant: -28).isActive = true

        titleLabel.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 18).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: 16).isActive = true

        quantily.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 45).isActive = true
        quantily.leadingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: 16).isActive = true

        sizeLabel.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 72).isActive = true
        sizeLabel.leadingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: 16).isActive = true

        priceLabel.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 45).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: 16).isActive = true

        pluseButton.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 50).isActive = true
        pluseButton.leadingAnchor.constraint(equalTo: quantily.trailingAnchor, constant: 30).isActive = true
        pluseButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        pluseButton.heightAnchor.constraint(equalToConstant: 15).isActive = true

        minusButton.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 50).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: pluseButton.trailingAnchor, constant: 23).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true

        quantilyShoes.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 49).isActive = true
        quantilyShoes.leadingAnchor.constraint(equalTo: pluseButton.trailingAnchor, constant: 7).isActive = true

        cartButton.trailingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: -10)
            .isActive = true
        cartButton.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 12).isActive = true
        cartButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        cartButton.heightAnchor.constraint(equalToConstant: 19).isActive = true

        sumPrice.topAnchor.constraint(equalTo: backbroundImageUiView.topAnchor, constant: 138).isActive = true
        sumPrice.trailingAnchor.constraint(equalTo: backbroundImageUiView.trailingAnchor, constant: 180)
            .isActive = true
    }

    func setupSizeButtons() {
        let buttons = [sizeButton36, sizeButton37, sizeButton38, sizeButton39, sizeButton40]
        var left = 185
        for button in buttons {
            button.layer.cornerRadius = 13
            button.backgroundColor = UIColor(red: 250 / 255, green: 235 / 255, blue: 244 / 255, alpha: 1.0)
            addSubview(button)
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(left)).isActive = true
            button.topAnchor.constraint(equalTo: topAnchor, constant: 97).isActive = true
            button.widthAnchor.constraint(equalToConstant: 31).isActive = true

            left += 38
        }
    }
}
