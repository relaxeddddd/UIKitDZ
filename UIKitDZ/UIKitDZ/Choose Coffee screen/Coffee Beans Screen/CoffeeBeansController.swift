// CoffeeBeansController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CoffeeBeansController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "beigeColor")

        // кружок наполовину закрытый
        let circleWhite = UIImageView(frame: CGRect(x: 24, y: 50, width: 44, height: 44))
        circleWhite.image = UIImage(named: "circleWhiteImage")
        view.addSubview(circleWhite)

        // новая вью
        let newView = UIView(frame: CGRect(x: 0, y: 62, width: 375, height: 750))
        newView.backgroundColor = .white
        newView.layer.cornerRadius = 15
        view.addSubview(newView)

        // кнопка закрыть
        let xButton = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        xButton.setImage(UIImage(named: "xImage"), for: .normal)
        newView.addSubview(xButton)

        // текст уточните
        let beansText = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 30))
        beansText.text = "Уточните обжарку зеренъ"
        beansText.font = UIFont(name: "Verdana-Bold", size: 14.0)
        beansText.textAlignment = .center
        newView.addSubview(beansText)

        // темная обжарка
        let rectangleDark = UIImageView(frame: CGRect(x: 15, y: 102, width: 165, height: 165))
        rectangleDark.image = UIImage(named: "rectangleBeans")
        newView.addSubview(rectangleDark)

        let beansDark = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        beansDark.image = UIImage(named: "darkBeanse")
        rectangleDark.addSubview(beansDark)

        let darkRoastButton = UIButton(type: .custom)
        darkRoastButton.frame = CGRect(x: 0, y: 112, width: 165, height: 40)
        darkRoastButton.setTitle("Темная\nобжарка", for: .normal)
        darkRoastButton.titleLabel?.numberOfLines = 2
        darkRoastButton.titleLabel?.textAlignment = .center
        darkRoastButton.setTitleColor(.black, for: .normal)
        darkRoastButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        rectangleDark.addSubview(darkRoastButton)

        // светлая обжарка
        let rectangleLight = UIImageView(frame: CGRect(x: 195, y: 102, width: 165, height: 165))
        rectangleLight.image = UIImage(named: "rectangleBeans")
        newView.addSubview(rectangleLight)

        let beanseLight = UIImageView(frame: CGRect(x: 32, y: 17, width: 100, height: 100))
        beanseLight.image = UIImage(named: "lightBeanse")
        rectangleLight.addSubview(beanseLight)

        let lightRoastButton = UIButton(type: .custom)
        lightRoastButton.frame = CGRect(x: 0, y: 117, width: 165, height: 40)
        lightRoastButton.setTitle("Светлая\nобжарка", for: .normal)
        lightRoastButton.titleLabel?.numberOfLines = 2
        lightRoastButton.titleLabel?.textAlignment = .center
        lightRoastButton.setTitleColor(.black, for: .normal)
        lightRoastButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        rectangleLight.addSubview(lightRoastButton)
    }
}
