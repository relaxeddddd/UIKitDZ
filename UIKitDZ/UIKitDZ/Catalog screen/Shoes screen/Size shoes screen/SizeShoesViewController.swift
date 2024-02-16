// SizeShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SizeShoesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = UIColor(white: 0.5, alpha: 0.8)
        setupWhiteView()
        setupCloseButton()
        setupLabels()
        setupLinerViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }

    func setupWhiteView() {
        let whiteView = UIView()
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 15
        whiteView.layer.masksToBounds = true
        view.addSubview(whiteView)

        whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        whiteView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 757).isActive = true
    }

    func setupCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        view.addSubview(closeButton)

        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 81).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }

    func setupLabels() {
        let labelStrings = ["35 EU", "36 EU", "37 EU", "38 EU", "39 EU"]
        let yPos: [CGFloat] = [132, 169, 206, 243, 280]

        for (index, labelText) in labelStrings.enumerated() {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = labelText
            label.textColor = .black
            label.textAlignment = .left
            label.font = UIFont(name: "Verdana", size: 14)
            view.addSubview(label)

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: yPos[index]).isActive = true
            label.widthAnchor.constraint(equalToConstant: 278).isActive = true
            label.heightAnchor.constraint(equalToConstant: 19).isActive = true
        }
    }

    func setupLinerViews() {
        let yPos: [CGFloat] = [158, 195, 232, 269, 306]
        let linerColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)

        for yPosition in yPos {
            let separatorView = UIView()
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            separatorView.backgroundColor = linerColor
            view.addSubview(separatorView)

            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            separatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: yPosition).isActive = true
            separatorView.widthAnchor.constraint(equalToConstant: 335).isActive = true
            separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }
}
