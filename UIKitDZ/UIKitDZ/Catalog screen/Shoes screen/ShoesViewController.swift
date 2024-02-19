// ShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

//protocol ShoesViewControllerDelegate: AnyObject {
    
    
    //func transitInformation(shouse: ShooseModel)
//}

class ShoesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //weak var delegat : ShoesViewControllerDelegate?

        view.backgroundColor = .white

        setupTitleLabel()
        setupKablImage()
        setupDebrImage()
        setupCrossImage()
        setupYellowShoeslImage()
        setupKedsImage()
        setupFirstButton()
        setupSecondButton()
        setupTheedButton()
        setupFourthButton()
        setupFifthButton()
        setupPriceLabels()
    }
    
    /*func setDelegate() {
            guard let basketViewController = (
                navigationController?.tabBarController?
                    .viewControllers?[1] as? UINavigationController
            )?.viewControllers[0] as? BasketViewController
            else { return }

            delegat = basketViewController
        } */

    func setupTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Обувь"
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .center

        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 53).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    var imageShoes = [UIImageView]()

    func setupImageView(
        imageName: String,
        width: CGFloat,
        height: CGFloat,
        imageSize: CGSize = CGSize(width: 100, height: 100),
        backgroundSize: CGSize = CGSize(width: 157, height: 157)
    ) {
        let imageViewBackground = UIImageView()
        imageViewBackground.translatesAutoresizingMaskIntoConstraints = false
        imageViewBackground.backgroundColor = UIColor(named: "buttonColor")
        view.addSubview(imageViewBackground)

        imageViewBackground.widthAnchor.constraint(equalToConstant: backgroundSize.width).isActive = true
        imageViewBackground.heightAnchor.constraint(equalToConstant: backgroundSize.height).isActive = true
        imageViewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: width).isActive = true
        imageViewBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: height).isActive = true

        let image = UIImageView(image: UIImage(named: imageName))
        imageShoes.append(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        imageViewBackground.addSubview(image)

        image.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
        image.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true
        image.centerXAnchor.constraint(equalTo: imageViewBackground.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: imageViewBackground.centerYAnchor).isActive = true
    }

    func setupKablImage() {
        setupImageView(imageName: "kablImage", width: 20, height: 130)
    }

    func setupDebrImage() {
        setupImageView(imageName: "debrImage", width: 198, height: 130)
    }

    func setupCrossImage() {
        setupImageView(imageName: "crossImage", width: 20, height: 303)
    }

    func setupYellowShoeslImage() {
        setupImageView(imageName: "yellowShoeslImage", width: 198, height: 303)
    }

    func setupKedsImage() {
        setupImageView(imageName: "kedsImage", width: 20, height: 476)
    }
    let prices = ["2250", "5750", "5750", "4250", "3500"]

    func setupPriceLabels() {
      
        let labelPositions = [
            (x: CGFloat(105), y: CGFloat(263)),
            (x: CGFloat(105), y: CGFloat(436)),
            (x: CGFloat(105), y: CGFloat(609)),
            (x: CGFloat(283), y: CGFloat(263)),
            (x: CGFloat(283), y: CGFloat(436))
        ]

        for (index, price) in prices.enumerated() {
            let priceLabel = UILabel()
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.text = price
            priceLabel.font = UIFont(name: "Verdana-Bold", size: 12)
            priceLabel.textColor = .black
            view.addSubview(priceLabel)

            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: labelPositions[index].x)
                .isActive = true
            priceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: labelPositions[index].y).isActive = true
            priceLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
            priceLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        }
    }

    func setupButton(imageName: String, widthButton: CGFloat, heightButton: CGFloat, tag: Int) {
        let buttonSize = CGSize(width: 20, height: 19)

        let button = UIButton()
        button.tag = tag
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "buttonColor")
        button.setImage(UIImage(named: imageName), for: .normal)
        view.addSubview(button)

        button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: widthButton).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: heightButton).isActive = true

        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    func setupFirstButton() {
        setupButton(imageName: "basketImage", widthButton: 146, heightButton: 141, tag: 0)
    }

    func setupSecondButton() {
        setupButton(imageName: "basketImage", widthButton: 146, heightButton: 314, tag: 1)
    }

    func setupTheedButton() {
        setupButton(imageName: "basketImage", widthButton: 146, heightButton: 488, tag: 2)
    }

    func setupFourthButton() {
        setupButton(imageName: "basketImage", widthButton: 327, heightButton: 141, tag: 3)
    }

    func setupFifthButton() {
        setupButton(imageName: "basketImage", widthButton: 327, heightButton: 314, tag: 4)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "basketImage") {
            sender.setImage(UIImage(named: "pinkBasketImage"), for: .normal)
        } else if sender.currentImage == UIImage(named: "pinkBasketImage") {
            sender.setImage(UIImage(named: "basketImage"), for: .normal)
        }
        //let shoes = ShooseModel(shooseImg: imageShouse[sender.tag].image ?? UIImage(), shoosePrice: prices[sender.tag])
                //delegat?.transitInformation(shouse: shoes)

        let sizeShoesVC = SizeShoesViewController()
        present(sizeShoesVC, animated: true)
    }
}
