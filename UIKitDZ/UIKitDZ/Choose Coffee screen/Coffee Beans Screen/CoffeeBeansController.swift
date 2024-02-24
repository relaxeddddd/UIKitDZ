// CoffeeBeansController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

//Экран с выбором обжарки зерен
final class CoffeeBeansController: UIViewController {
    // var delegate: SelectionRoastCoffeDelegate?
    // var selectedRoastText: String?

    // MARK: - Visual Component

    private lazy var circleWhiteImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 24, y: 50, width: 44, height: 44))
        imageView.image = UIImage(named: "circleWhiteImage")
        return imageView
    }()

    private lazy var newView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 62, width: 375, height: 750))
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()

    
    private lazy var xButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(named: "xImage"), for: .normal)
        return button
    }()

    
    private lazy var beansTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 30))
        label.text = "Уточните обжарку зеренъ"
        label.font = UIFont(name: "Verdana-Bold", size: 14.0)
        label.textAlignment = .center
        return label
    }()

   
    private lazy var rectangleDarkImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 15, y: 102, width: 165, height: 165))
        imageView.image = UIImage(named: "rectangleBeans")
        return imageView
    }()


    private lazy var beansDark: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        imageView.image = UIImage(named: "darkBeanse")
        return imageView
    }()

    private lazy var darkRoastsButton: UIButton = {
        let darkButton = UIButton(type: .custom)
        darkButton.frame = CGRect(x: 0, y: 112, width: 165, height: 40)
        darkButton.setTitle("Темная\nобжарка", for: .normal)
        darkButton.titleLabel?.numberOfLines = 2
        darkButton.titleLabel?.textAlignment = .center
        darkButton.setTitleColor(.black, for: .normal)
        darkButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        // darkButton.addTarget(self, action: #selector(darkRoastButtonTapped), for: .touchUpInside)
        return darkButton
    }()

    
    private lazy var rectangleLightImageView: UIImageView = {
        let light = UIImageView(frame: CGRect(x: 195, y: 102, width: 165, height: 165))
        light.image = UIImage(named: "rectangleBeans")
        return light
    }()

    private lazy var beanseLightImageView: UIImageView = {
        let beanse = UIImageView(frame: CGRect(x: 32, y: 17, width: 100, height: 100))
        beanse.image = UIImage(named: "lightBeanse")
        return beanse
    }()

    private lazy var lightRoastButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 117, width: 165, height: 40)
        button.setTitle("Светлая\nобжарка", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        // button.addTarget(self, action: #selector(lightRoastButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = UIColor(named: "beigeColor")
    }

    // MARK: - Private Methods

    // кладем все элементы на экран
    private func setupViews() {
        view.addSubview(circleWhiteImageView)
        view.addSubview(newView)
        newView.addSubview(xButton)
        newView.addSubview(beansTextLabel)
        newView.addSubview(rectangleDarkImageView)
        rectangleDarkImageView.addSubview(beansDark)
        rectangleDarkImageView.addSubview(darkRoastsButton)
        newView.addSubview(rectangleLightImageView)
        rectangleLightImageView.addSubview(beanseLightImageView)
        rectangleLightImageView.addSubview(lightRoastButton)
    }
}

/* тут будет реализация кнопок для передачи картинки и текста в контроллер Ильи (варианты обжарок кофе

 extension CoffeeBeansController {
     @objc func darkRoastButtonTapped() {
         darkRoastsButton.layer.borderWidth = 1
         lightRoastButton.layer.borderWidth = 0
         darkRoastsButton.backgroundColor = .green

         if let selectedImage = beansDark.image {
             delegate?.sendTheImage(selectedImage)
         }
         delegate?.sendTheText(darkRoastsButton.titleLabel?.text ?? "")
     }

     @objc func lightRoastButtonTapped() {
         lightRoastButton.layer.borderWidth = 1
         darkRoastsButton.layer.borderWidth = 0
         lightRoastButton.backgroundColor = .green

         if let selectedImage = beanseLight.image {
             delegate?.sendTheImage(selectedImage)
         }
         delegate?.sendTheText(lightRoastButton.titleLabel?.text ?? "")
     }

     @objc func beansDarkTapped() {
         // Устанавливаем толщину обводки
         beansDark.layer.borderWidth = 10
         // Устанавливаем цвет обводки
         beansDark.layer.borderColor = UIColor.green.cgColor
     }

     @objc func beansLightTapped() {
         // Устанавливаем толщину обводки
         beanseLight.layer.borderWidth = 10
         // Устанавливаем цвет обводки
         beanseLight.layer.borderColor = UIColor.green.cgColor
     }
 }
 */
