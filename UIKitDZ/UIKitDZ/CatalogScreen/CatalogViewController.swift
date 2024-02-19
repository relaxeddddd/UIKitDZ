// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CatalogViewController: UIViewController {
    var segmentControll = UISegmentedControl()
    var pepoleArray = ["Женщинам", "Мужчинам", "Детям"]
    var rectangleImagesView: [UIImageView] = []
    var rightShoesImageView = UIImageView()
    var leftShoesImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupBarButton()
        setupSegmentControl()
        setupMensShoesImage()
        setupRectangleImages()
        setupFirstRectangleContent()
        setupSecondRectangleContent()
        setupFgirdRectangleContent()
        view.addSubview(rightShoesImageView)
        view.addSubview(leftShoesImageView)
        setupShoesButton()
    }

    func setupSegmentControl() {
        segmentControll = UISegmentedControl(items: pepoleArray)
        segmentControll.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControll)

        if let index = pepoleArray.firstIndex(of: "Мужчинам") {
            segmentControll.selectedSegmentIndex = index
        }
        segmentControll.addTarget(self, action: #selector(segmentControlValueChanged(_:)), for: .valueChanged)

        // для положения по х
        segmentControll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        segmentControll.widthAnchor.constraint(equalToConstant: 345).isActive = true
        // для положения по у
        segmentControll.topAnchor.constraint(equalTo: view.topAnchor, constant: 122).isActive = true
        segmentControll.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    @objc func segmentControlValueChanged(_ sender: UISegmentedControl) {
        let imagesForSegment: [Int: [UIImage?]] = [
            0: [
                UIImage(named: "wonanTufliImage"),
                UIImage(named: "bagWomanImage"),
                UIImage(named: "womanTshoesImage"),
                UIImage(named: "flipFlopsImage")
            ],
            1: [
                UIImage(named: "manTufliImage"),
                UIImage(named: "bagManImage"),
                UIImage(named: "manTImage"),
                UIImage(named: "manKedsImage")
            ],
            2: [
                UIImage(named: "kidsTufliImage"),
                UIImage(named: "kidsBagImage"),
                UIImage(named: "kidsTImage"),
                UIImage(named: "kidsKedsImage")
            ]
        ]

        guard let images = imagesForSegment[sender.selectedSegmentIndex] else {
            return
        }

        rightShoesImageView.image = images[2]
        leftShoesImageView.image = images[3]

        // cоответствующие изображения для каждого прямоугольника
        for (_, imageView) in rectangleImagesView[1].subviews.enumerated() {
            if let imageView = imageView as? UIImageView {
                imageView.image = images[0] // Изображение обуви
            }
        }

        for (_, imageView) in rectangleImagesView[2].subviews.enumerated() {
            if let imageView = imageView as? UIImageView {
                imageView.image = images[1] // Изображение сумки
            }
        }
    }

    // создаем справа картинку обуви
    func setupMensShoesImage() {
        let menShoesrRightImageView = UIImageView()
        menShoesrRightImageView.translatesAutoresizingMaskIntoConstraints = false
        menShoesrRightImageView.image = UIImage(named: "manTImage")
        // тень для картинки
        menShoesrRightImageView.layer.shadowColor = UIColor.black.cgColor
        menShoesrRightImageView.layer.shadowOpacity = 0.5
        menShoesrRightImageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        menShoesrRightImageView.layer.shadowRadius = 4
        // создаем картинку слева
        view.addSubview(menShoesrRightImageView)

        // ограничения для правой картинки обуви
        menShoesrRightImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        menShoesrRightImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        menShoesrRightImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        menShoesrRightImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        // Присваиваем созданные картинки свойствам класса
        rightShoesImageView = menShoesrRightImageView

        let menShoesrLeftImageView = UIImageView()
        menShoesrLeftImageView.translatesAutoresizingMaskIntoConstraints = false
        menShoesrLeftImageView.image = UIImage(named: "manKedsImage")
        // тень
        menShoesrLeftImageView.layer.shadowColor = UIColor.black.cgColor
        menShoesrLeftImageView.layer.shadowOpacity = 0.5
        menShoesrLeftImageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        menShoesrLeftImageView.layer.shadowRadius = 4

        view.addSubview(menShoesrLeftImageView)

        // ограничения для левой картинки обуви
        menShoesrLeftImageView.leadingAnchor.constraint(equalTo: menShoesrRightImageView.trailingAnchor, constant: 16)
            .isActive = true
        menShoesrLeftImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        menShoesrLeftImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        menShoesrLeftImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        // Присваиваем созданные картинки свойствам класса
        leftShoesImageView = menShoesrLeftImageView
    }

    // 3 прямоугольника
    func setupRectangleImages() {
        let imageSize = CGSize(width: 335, height: 80)
        let _ = ["rectangleImage", "rectangleImage", "rectangleImage"]
        let yPositions: [CGFloat] = [326, 426, 526]
        for (_, yPos) in yPositions.enumerated() {
            let rectangleImageView = UIImageView()
            rectangleImageView.translatesAutoresizingMaskIntoConstraints = false
            rectangleImageView.image = UIImage(named: "rectangleImage")
            view.addSubview(rectangleImageView)

            // ограничения для прямоугольников
            rectangleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            rectangleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: yPos).isActive = true
            rectangleImageView.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
            rectangleImageView.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true

            rectangleImagesView.append(rectangleImageView)
        }
    }

    // для первого прямоугольника
    func setupFirstRectangleContent() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Бренды"
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.textColor = UIColor.black
        rectangleImagesView[0].addSubview(label) // Добавляем на первый прямоугольник

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "brendsImage")
        rectangleImagesView[0].addSubview(imageView) // Добавляем на первый прямоугольник

        // констрейнты для UILabel
        label.leadingAnchor.constraint(equalTo: rectangleImagesView[0].leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: rectangleImagesView[0].topAnchor, constant: 31).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true

        // констрейнты для UIImageView
        imageView.leadingAnchor.constraint(equalTo: rectangleImagesView[0].leadingAnchor, constant: 233).isActive = true
        imageView.topAnchor.constraint(equalTo: rectangleImagesView[0].topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    // для второго прямоугольника
    func setupSecondRectangleContent() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Обувь"
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.textColor = UIColor.black
        rectangleImagesView[1].addSubview(label)

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "manTufliImage")
        rectangleImagesView[1].addSubview(imageView)

        // Констрейнты для UILabel
        label.leadingAnchor.constraint(equalTo: rectangleImagesView[1].leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: rectangleImagesView[1].topAnchor, constant: 31).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true

        // Констрейнты для UIImageView
        imageView.leadingAnchor.constraint(equalTo: rectangleImagesView[1].leadingAnchor, constant: 233)
            .isActive = true
        imageView.topAnchor.constraint(equalTo: rectangleImagesView[1].topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    // для третьего прямоугольника
    func setupFgirdRectangleContent() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Сумки"
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.textColor = UIColor.black
        rectangleImagesView[2].addSubview(label)

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "bagManImage")
        rectangleImagesView[2].addSubview(imageView)

        // Констрейнты для UILabel
        label.leadingAnchor.constraint(equalTo: rectangleImagesView[2].leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: rectangleImagesView[2].topAnchor, constant: 31).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 17).isActive = true

        // Констрейнты для UIImageView
        imageView.leadingAnchor.constraint(equalTo: rectangleImagesView[2].leadingAnchor, constant: 233)
            .isActive = true
        imageView.topAnchor.constraint(equalTo: rectangleImagesView[2].topAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    func setupShoesButton() {
        // Создаем прозрачную кнопку
        let shoesButton = UIButton(type: .custom)
        shoesButton.backgroundColor = .clear
        shoesButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shoesButton)

        // Устанавливаем координаты и размеры кнопки
        shoesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        shoesButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 426).isActive = true
        shoesButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        shoesButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        // Добавляем обработчик события нажатия на кнопку
        shoesButton.addTarget(self, action: #selector(shoesButtonTapped), for: .touchUpInside)
    }

    // Метод для обработки события нажатия на кнопку обуви
    @objc func shoesButtonTapped() {
        let shoesVeControl = ShoesViewController()
        navigationController?.pushViewController(shoesVeControl, animated: true)
    }

    private func setupBarButton() {
        navigationItem.title = "Каталог"
    }
}
