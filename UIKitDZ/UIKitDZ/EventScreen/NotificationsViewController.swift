// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомления
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
                userImageName: "otherUserImage",
                userText: "lavanda123 понравился ваш комментарий: 'Очень красиво!' 12ч",
                imageName: "mainOne"
            )
        ]),
        .comment([
            CommentItemCell(
                userImageName: "otherUserImage",
                userText: "lavanda123 упомянула вас в комментарии: @rm Спасибо! 12ч",
                imageName: "mainOne"
            )
        ])
    ]

    private var onWeek: [CellNotificationType] = [
        .comment([
            CommentItemCell(
                userImageName: "otherUserImage",
                userText: "lavanda123 понравился ваш комментарий: 'Это где?' 3д.",
                imageName: "imageComments"
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUserName: "12miho",
                userComment: "12miho появилась(-ась) в RMLink. Вы можете быть знакомы 3д."
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUserName: "otherUserImage",
                userComment: "lavanda123 \nподписался(-ась) на ваши новости 5д."
            )
        ]),
        .comment([
            CommentItemCell(
                userImageName: "otherUserImage",
                userText: "lavanda123 понравился ваш комментарий: 'Ты вернулась?' 7д.",
                imageName: "imageComments"
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUserName: "marks",
                userComment: "markS появилась(-ась) в RMLink. Вы можете быть знакомы 8д."
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUserName: "sv_neit",
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

/// MARK: - NotificationsViewController + UITableViewDelegate
extension NotificationsViewController: UITableViewDelegate {}

/// MARK: - NotificationsViewController + UITableViewDataSource
/// Расширение для работы с методами dataSource
extension NotificationsViewController: UITableViewDataSource {
    
    /// Количество секций
    /// - Returns: количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberOfSections
    }
    
    /// Количество ячеек в секции
    /// - Returns: ячеек в секции
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
    
    /// Заполнение контентом ячейку
    /// - Returns: заполненную ячейку
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
                ) as? SubscribeCell, let subscribeItem = subscribe.first else { return UITableViewCell() }
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
                ) as? CommentCell, let comment = comments.first else { return UITableViewCell() }
                subscribeCell.configure(with: comment)
                return subscribeCell

            case let .subscribe(subscribe):
                guard let subscribeCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell, let subscribeItem = subscribe.first else { return UITableViewCell() }
                subscribeCell.configure(with: subscribeItem)
                return subscribeCell
            }
        default:
            return UITableViewCell()
        }
    }
    
    /// Хедеры секций
    /// - Returns: хедер над каждой секцией
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = section == 0 ? Constants.todayTitle : Constants.onWeekTitle
        return label
    }
}
