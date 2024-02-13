// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // коричневый экран
        view.backgroundColor = UIColor(named: "newBrown")

        // лого кофейни
        let logoImage = UIImageView(frame: CGRect(x: 100, y: 49, width: 175, height: 76))
        logoImage.image = UIImage(named: "coffeLogoImage")
        view.addSubview(logoImage)

        // приветствие
        let greeting = UITextView(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        greeting.text = "Добро пожаловать,\nГость"
        greeting.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        greeting.backgroundColor = UIColor.clear
        greeting.textAlignment = .left
        greeting.font = UIFont(name: "Verdana-Bold", size: 13.0)
        view.addSubview(greeting)

        // круг с буквой Г
        let circle = UIImageView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        circle.image = UIImage(named: "circleImage")
        view.addSubview(circle)

        let labelL = UILabel()
        labelL.frame = CGRect(x: 0, y: 0, width: circle.frame.width, height: circle.frame.height)
        labelL.text = "Г"
        labelL.textColor = .white
        labelL.textAlignment = .center
        labelL.font = UIFont(name: "Verdana-Bold", size: 20)
        circle.addSubview(labelL)

        // белая вью
        let newView = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        newView.backgroundColor = .white
        newView.layer.cornerRadius = 12
        view.addSubview(newView)

        // адреса кофеен
        let rectangleMint = UIImageView(frame: CGRect(x: 20, y: 40, width: 335, height: 70))
        rectangleMint.image = UIImage(named: "rectangleMint")
        newView.addSubview(rectangleMint)

        let adressCof = UILabel()
        adressCof.frame = CGRect(x: 15, y: 12, width: 150, height: 15)
        adressCof.text = "Адреса кофеен"
        adressCof.textColor = .black
        adressCof.backgroundColor = .clear
        adressCof.font = UIFont(name: "Verdana-Bold", size: 14.0)
        rectangleMint.addSubview(adressCof)

        let geolocation = UILabel()
        geolocation.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
        geolocation.textColor = .lightGray
        geolocation.font = UIFont(name: "Verdana", size: 10.0)
        geolocation.text = "Разрѣшите доступъ къ ​геолокаціи для\nпоиска ближайшей кофейни"
        geolocation.numberOfLines = 2
        geolocation.backgroundColor = .clear
        rectangleMint.addSubview(geolocation)

        let dot = UIImageView(frame: CGRect(x: 289, y: 19, width: 20, height: 30))
        dot.image = UIImage(named: "dotImage")
        rectangleMint.addSubview(dot)

        // лого меню
        let logoMenu = UIImageView(frame: CGRect(x: 124, y: 122, width: 125, height: 80))
        logoMenu.image = UIImage(named: "menuImage")
        newView.addSubview(logoMenu)

        // Первая позиция меню "Пти пате"
        let rectangleOne = UIImageView(frame: CGRect(x: 20, y: 216, width: 335, height: 80))
        rectangleOne.image = UIImage(named: "rectangleImage")
        newView.addSubview(rectangleOne)

        let ptiPate = UILabel()
        ptiPate.frame = CGRect(x: 25, y: 30, width: 180, height: 19)
        ptiPate.text = "Пти пате aля «РюсЪ»"
        ptiPate.textColor = .black
        ptiPate.backgroundColor = .clear
        ptiPate.font = UIFont(name: "Verdana-Bold", size: 14.0)
        ptiPate.textAlignment = .left
        rectangleOne.addSubview(ptiPate)

        let cakeImage = UIImageView(frame: CGRect(x: 272, y: 221, width: 70, height: 70))
        cakeImage.image = UIImage(named: "cakeImage")
        newView.addSubview(cakeImage)

        // вторая позиция меню
        let rectangleTwo = UIImageView(frame: CGRect(x: 20, y: 316, width: 335, height: 80))
        rectangleTwo.image = UIImage(named: "rectangleImage")
        newView.addSubview(rectangleTwo)

        let hotBeverages = UILabel()
        hotBeverages.frame = CGRect(x: 25, y: 30, width: 180, height: 19)
        hotBeverages.text = "Горячiя напитки"
        hotBeverages.textColor = .black
        hotBeverages.backgroundColor = .clear
        hotBeverages.font = UIFont(name: "Verdana-Bold", size: 14.0)
        hotBeverages.textAlignment = .left
        rectangleTwo.addSubview(hotBeverages)

        let capImage = UIImageView(frame: CGRect(x: 252, y: 15, width: 70, height: 48))
        capImage.image = UIImage(named: "capCoffeeImage")
        rectangleTwo.addSubview(capImage)

        // третья позиция/ кнопка
        let rectangleThree = UIImageView(frame: CGRect(x: 20, y: 416, width: 335, height: 80))
        rectangleThree.image = UIImage(named: "rectangleImage")
        newView.addSubview(rectangleThree)

        let capSpoon = UIImageView(frame: CGRect(x: 252, y: 5, width: 70, height: 70))
        capSpoon.image = UIImage(named: "capSpoonImage")
        rectangleThree.addSubview(capSpoon)

        let coffeText = UILabel()
        coffeText.frame = CGRect(x: 25, y: 30, width: 180, height: 19)
        coffeText.text = "Кофий"
        coffeText.font = UIFont(name: "Verdana-Bold", size: 14.0)
        coffeText.textAlignment = .left
        coffeText.backgroundColor = .clear
        coffeText.textColor = .black
        rectangleThree.addSubview(coffeText)

        let coffeeButton = UIButton(frame: CGRect(
            x: 0,
            y: 0,
            width: rectangleThree.frame.width,
            height: rectangleThree.frame.height
        ))
        coffeeButton.backgroundColor = .clear
        rectangleThree.addSubview(coffeeButton)
    }
}
