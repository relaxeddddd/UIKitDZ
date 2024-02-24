// StackView  .swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для ототбражения светоформа с помощью NSLayoutAnchor
class StackView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let spacing: CGFloat = 10.0
    }

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
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()

    private var yellowView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()

    private lazy var rootStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = Constants.spacing
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    // MARK: Private Methods

    private func setView() {
        view.addSubview(blackView)
        blackView.addSubview(rootStackView)
        setConstraintsBlackView()
        setConstraintsRootStackView()
    }

    private func setConstraintsBlackView() {
        blackView.topAnchor.constraint(equalTo: rootStackView.topAnchor, constant: -10).isActive = true
        blackView.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 10).isActive = true
        blackView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: -10).isActive = true
        blackView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 10).isActive = true
    }

    private func setConstraintsRootStackView() {
        rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rootStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        rootStackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
    }
}
