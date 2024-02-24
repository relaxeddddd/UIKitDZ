// NSLayoutAnchor.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения светофора с помощью NSLayoutConstraint
class NSLayoutAnchor: UIViewController {
    // MARK: - Visual Components

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var yellowView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Private Methods

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(blackView)
        blackView.addSubview(redView)
        blackView.addSubview(yellowView)
        blackView.addSubview(greenView)
        setupAnchorsYellowView()
        setupAnchorsRedView()
        setupAnchorsGreenView()
        setupAnchorsBlackView()
    }

    private func setupAnchorsYellowView() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
    }

    private func setupAnchorsRedView() {
        redView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -10).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func setupAnchorsGreenView() {
        greenView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func setupAnchorsBlackView() {
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10).isActive = true
        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10).isActive = true
    }
}
