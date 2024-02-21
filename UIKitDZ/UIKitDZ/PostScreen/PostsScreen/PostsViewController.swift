// PostsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения главноего экрана с поставми
final class PostsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let storiesIdentifire = "StoriesCell"
        static let postsIdentifire = "PostCell"
        static let recomendationsIdentifire = "RecomindationCell"
        static let storiesHeightCell = 100
        static let postsHeightCell = 450
        static let recomendationsHeightCell = 270
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: Private Properties

    private var items: [CellType] = [
        .stories([
            Stories(imageName: "mainUserImage", name: "Ваша история", addButton: true),
            Stories(imageName: "otherUserImage", name: "Nihao1337", addButton: false),
            Stories(imageName: "otherUserImage", name: "Nihao1337", addButton: false),
            Stories(imageName: "otherUserImage", name: "Nihao1337", addButton: false),
            Stories(imageName: "otherUserImage", name: "Nihao1337", addButton: false),
            Stories(imageName: "otherUserImage", name: "Nihao1337", addButton: false),
            Stories(imageName: "otherUserImage", name: "Nihao1337", addButton: false)
        ]),
        .post([
            Post(
                imageUserName: "imageDagestan",
                username: "tur_v_dagestan",
                postImageName: ["mainOne", "mainTwo", "mainOne", "mainTwo"],
                numberLikes: "Нравится: 201",
                userComent: "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
                time: "10 минут назад"
            )
        ]),
        .recomendation([
            Recomendation(imageName: "recomendationOne", label: "cremea_082"),
            Recomendation(imageName: "recomendationTwo", label: "mary_pol"),
            Recomendation(imageName: "recomendationTwo", label: "mary_pol")
        ]),
        .post([
            Post(
                imageUserName: "imageDagestan",
                username: "tur_v_dagestan",
                postImageName: ["mainTwo"],
                numberLikes: "Нравится: 201",
                userComent: "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "imageDagestan",
                username: "tur_v_dagestan",
                postImageName: ["mainOne", "mainTwo"],
                numberLikes: "Нравится: 201",
                userComent: "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "imageDagestan",
                username: "tur_v_dagestan",
                postImageName: ["mainOne"],
                numberLikes: "Нравится: 201",
                userComent: "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "imageDagestan",
                username: "tur_v_dagestan",
                postImageName: ["mainTwo"],
                numberLikes: "Нравится: 201",
                userComent: "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "imageDagestan",
                username: "tur_v_dagestan",
                postImageName: ["mainTwo", "mainOne"],
                numberLikes: "Нравится: 201",
                userComent: "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
                time: "10 минут назад"
            )
        ])
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBarItems()
    }

    // MARK: - Private Methods

    private func setupBarItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "iconLogo")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: nil
        )

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "iconDirect")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: nil
        )
    }

    private func setupTableView() {
        tableView.register(StoriesCell.self, forCellReuseIdentifier: Constants.storiesIdentifire)
        tableView.register(PostCell.self, forCellReuseIdentifier: Constants.postsIdentifire)
        tableView.register(RecomindationCell.self, forCellReuseIdentifier: Constants.recomendationsIdentifire)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

/// MARK: - NotificationsViewController + UITableViewDelegate
extension PostsViewController: UITableViewDelegate {}

/// MARK: - NotificationsViewController + UITableViewDataSource
extension PostsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = items[section]
        switch cell {
        case .stories:
            return 1
        case let .post(posts):
            return posts.count
        case .recomendation:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]

        switch item {
        case let .stories(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storiesIdentifire,
                for: indexPath
            ) as? StoriesCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info)
            return cell
        case let .post(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postsIdentifire,
                for: indexPath
            ) as? PostCell
            else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info[indexPath.row])
            return cell
        case let .recomendation(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendationsIdentifire,
                for: indexPath
            ) as? RecomindationCell
            else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = items[indexPath.section]
        switch cell {
        case .stories:
            return CGFloat(Constants.storiesHeightCell)
        case .post:
            return CGFloat(Constants.postsHeightCell)
        case .recomendation:
            return CGFloat(Constants.recomendationsHeightCell)
        }
    }
}
