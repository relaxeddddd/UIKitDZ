// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения экрана профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let fontVerdanaBold = "Verdana-Bold"
        static let menuButtonImageName = "menuButton"
        static let addButtonImageName = "addButton"
        static let clouseButtonImageName = "clouse"
        static let clouseButtonTitle = "  mary_rmLink"
        static let profileInformationCellIdentifire = "ProfileInformationCell"
        static let profileStoriesCellCellIdentifire = "ProfileStoriesCell"
        static let collectionCellCellIdentifire = "CollectionCell"
        static let rows = 1
        static let storiesHeight = 100
        static let profileInformationHeight = 220
        static let postsHeight = 380
    }

    // MARK: - Private Properties

    private let tableView = UITableView()
    private let items: [ProfileCellTypes] = [
        .profileInformation(ProfileInformation(
            userImageName: "mainUserImage",
            link: "www.spacex.com",
            namePerson: "Мария Ивановна",
            jobTitle: "Консультант"
        )),
        .stories([
            ProfileStories(imageName: "roketImage", name: "Запуск"),
            ProfileStories(imageName: "moonImage", name: "Луна"),
            ProfileStories(imageName: "cosmonautImage", name: "Космана..."),
            ProfileStories(imageName: "spaceImage", name: "Космос"),
            ProfileStories(imageName: "roketImage", name: "Запуск"),
            ProfileStories(imageName: "moonImage", name: "Плутон")
        ]),
        .posts
    ]

    // MARK: - Lyfe Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupNavigationItems()
        setTableView()
        setupRefreshControl()
    }

    // MARK: - Private Methods

    private func setupRefreshControl() {
        let refreshControl: UIRefreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
            return refreshControl
        }()
        tableView.refreshControl = refreshControl
    }

    private func setupNavigationItems() {
        let menuButton = UIBarButtonItem(
            image: UIImage(named: Constants.menuButtonImageName),
            style: .plain,
            target: self,
            action: nil
        )
        menuButton.tintColor = .black
        let addButton = UIBarButtonItem(
            image: UIImage(named: Constants.addButtonImageName),
            style: .plain,
            target: self,
            action: nil
        )
        addButton.tintColor = .black
        navigationItem.rightBarButtonItems = [menuButton, addButton]

        let clouseButton = UIButton(type: .custom)
        clouseButton.tintColor = .black
        clouseButton.setImage(UIImage(named: Constants.clouseButtonImageName), for: .normal)
        clouseButton.setTitle(Constants.clouseButtonTitle, for: .normal)
        clouseButton.setTitleColor(.black, for: .normal)
        clouseButton.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 18)
        clouseButton.titleLabel?.textAlignment = .center
        clouseButton.sizeToFit()

        let barButtonLeft = UIBarButtonItem(customView: clouseButton)
        navigationItem.leftBarButtonItem = barButtonLeft
    }

    private func setTableView() {
        view.addSubview(tableView)
        tableView.register(
            ProfileInformationCell.self,
            forCellReuseIdentifier: Constants.profileInformationCellIdentifire
        )
        tableView.register(ProfileStoriesCell.self, forCellReuseIdentifier: Constants.profileStoriesCellCellIdentifire)
        tableView.register(CollectionCell.self, forCellReuseIdentifier: Constants.collectionCellCellIdentifire)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func showWkWebViewController() {
        let webViewController = WKWebViewController()
        present(webViewController, animated: true)
    }

    @objc private func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }
}

// MARK: - ProfileViewController + UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {}

// MARK: - ProfileViewController + UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = items[section]
        switch cell {
        case .stories:
            return Constants.rows
        case .profileInformation:
            return Constants.rows
        case .posts:
            return Constants.rows
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]

        switch item {
        case let .profileInformation(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileInformationCellIdentifire,
                for: indexPath
            ) as? ProfileInformationCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info)
            cell.present = { [weak self] in
                self?.showWkWebViewController()
            }
            return cell
        case let .stories(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileStoriesCellCellIdentifire,
                for: indexPath
            ) as? ProfileStoriesCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info)
            return cell

        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.collectionCellCellIdentifire,
                    for: indexPath
                ) as? CollectionCell
            else { return UITableViewCell() }

            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = items[indexPath.section]
        switch cell {
        case .stories:
            return CGFloat(Constants.storiesHeight)
        case .profileInformation:
            return CGFloat(Constants.profileInformationHeight)
        case .posts:
            return CGFloat(Constants.postsHeight)
        }
    }
}
