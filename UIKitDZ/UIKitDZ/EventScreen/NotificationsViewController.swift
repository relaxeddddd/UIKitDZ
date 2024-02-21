// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран уведомления
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let navigationTitle = "Уведомления"
        static let numberOfSections = 2
        static let identifierComments = "CommentCell"
        static let identifierSubscribe = "SubscribeCell"
        static let todayTitle = "  Сегодня"
        static let onWeekTitle = "  На этой неделе"
        static let subRequestText = "Запросы на подписку"
        static let fontVerdana = "Verdana"
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let subRequest: UILabel = {
        let label = UILabel()
        label.text = Constants.subRequestText
        label.font = UIFont(name: Constants.fontVerdana, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private properties

    private var today: [CellNotificationType] = [
        .comment([
            CommentItemCell(
                userImage: "otherUserImage",
                userText: "lavanda123 понравился ваш комментарий: 'Очень красиво!' 12ч",
                image: "mainOne"
            )
        ]),
        .comment([
            CommentItemCell(
                userImage: "otherUserImage",
                userText: "lavanda123 упомянула вас в комментарии: @rm Спасибо! 12ч",
                image: "mainOne"
            )
        ])
    ]

    private var onWeek: [CellNotificationType] = [
        .comment([
            CommentItemCell(
                userImage: "otherUserImage",
                userText: "lavanda123 понравился ваш комментарий: 'Это где?' 3д.",
                image: "imageComments"
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUser: "12miho",
                userComment: "12miho появилась(-ась) в RMLink. Вы можете быть знакомы 3д."
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUser: "otherUserImage",
                userComment: "lavanda123 \nподписался(-ась) на ваши новости 5д."
            )
        ]),
        .comment([
            CommentItemCell(
                userImage: "otherUserImage",
                userText: "lavanda123 понравился ваш комментарий: 'Ты вернулась?' 7д.",
                image: "imageComments"
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUser: "marks",
                userComment: "markS появилась(-ась) в RMLink. Вы можете быть знакомы 8д."
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUser: "sv_neit",
                userComment: "sv_neit появилась(-ась) в RMLink. Вы можете быть знакомы 8д."
            )
        ])
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultBackgroundColor()
        setupTableView()
        setupNavigationItems()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        tableView.register(CommentCell.self, forCellReuseIdentifier: Constants.identifierComments)
        tableView.register(SubscribeCell.self, forCellReuseIdentifier: Constants.identifierSubscribe)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = .clear
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupNavigationItems() {
        navigationItem.title = Constants.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Extension

extension NotificationsViewController: UITableViewDelegate {}

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return today.count
        case 1:
            return onWeek.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let item = today[indexPath.row]
            switch item {
            case let .comment(comments):
                guard let commentCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierComments,
                    for: indexPath
                ) as? CommentCell,
                    let comment = comments.first else { fatalError() }
                commentCell.configure(with: comment)
                return commentCell

            case let .subscribe(subscribe):
                guard let commentCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell, let subscribeItem = subscribe.first else { fatalError() }
                commentCell.configure(with: subscribeItem)
                return commentCell
            }

        case 1:
            let item = onWeek[indexPath.row]
            switch item {
            case let .comment(comments):
                guard let subscribeCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierComments,
                    for: indexPath
                ) as? CommentCell, let comment = comments.first else { fatalError() }
                subscribeCell.configure(with: comment)
                return subscribeCell

            case let .subscribe(subscribe):
                guard let subscribeCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell, let subscribeItem = subscribe.first else { fatalError() }
                subscribeCell.configure(with: subscribeItem)
                return subscribeCell
            }
        default:
            fatalError()
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = section == 0 ? Constants.todayTitle : Constants.onWeekTitle
        return label
    }
}
