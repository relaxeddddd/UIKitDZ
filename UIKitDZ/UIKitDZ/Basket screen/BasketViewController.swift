// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения экрана корзины
class BasketViewController: UIViewController {
    // MARK: - Public Properties

    var shouses: [ShooseModel] = [] {
        didSet {
            addShouse()
        }
    }

//    weak var delegate: ShoesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupBarButton()
//        view.addSubview(basketView)
//        basketView.translatesAutoresizingMaskIntoConstraints = false
//        basketView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        basketView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive = true
//        basketView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        basketView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -539).isActive = true
    }

    // MARK: - Private Methods

    private func setupBarButton() {
        navigationItem.title = "Корзина"
    }

    private func createBlock(shouse: ShooseModel, coordinateY: Int) {
        let basketView = BasketView()
        basketView.imageShoose.image = shouse.shooseImg
        basketView.sumPrice.text = shouse.shoosePrice

        view.addSubview(basketView)
        basketView.translatesAutoresizingMaskIntoConstraints = false
        basketView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        basketView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(coordinateY)).isActive = true
        basketView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func addShouse() {
        var coordinateY = 116
        for shouse in shouses {
            createBlock(shouse: shouse, coordinateY: coordinateY)
            coordinateY += 180
        }
    }
}

// extension BasketViewController: ShoesViewControllerDelegate {
//    func transferInformation(zxc: ShooseModel) {
//        shouses.append(zxc)
//    }
// }
