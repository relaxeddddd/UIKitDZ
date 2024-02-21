// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс с экраном уведомлений
class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let navigationTitle = "Уведомления"
        static let numberOfSections = 2
        static let identifierComments = "CommentCell"
        static let identifierSubscribe = "SubscribeCell"
        static let todayTitle = "  Сегодня"
        static let onWeekTitle = "  На этой неделе"
    }

    // MARK: - Visual Components

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let subRequest: UILabel = {
        let label = UILabel()
        label.text = "Запросы на подписку"
        label.font = UIFont(name: "Verdana", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private properties

    private var today: [CellNotificationType] = [
        .comment([
            ModelCommentCell(
                userImage: UIImage(named: "otherUserImage") ?? UIImage(),
                userText: "lavanda123 понравился ваш комментарий: 'Очень красиво!' 12ч",
                image: UIImage(named: "mainOne") ?? UIImage()
            )
        ]),
        .comment([
            ModelCommentCell(
                userImage: UIImage(named: "otherUserImage") ?? UIImage(),
                userText: "lavanda123 упомянула вас в комментарии: @rm Спасибо! 12ч",
                image: UIImage(named: "mainOne") ?? UIImage()
            )
        ])
    ]

    private var onWeek: [CellNotificationType] = [
        .comment([
            ModelCommentCell(
                userImage: UIImage(named: "otherUserImage") ?? UIImage(),
                userText: "lavanda123 понравился ваш комментарий: 'Это где?' 3д.",
                image: UIImage(named: "imageComments") ?? UIImage()
            )
        ]),
        .subscribe([
            ModelSubscribeCell(
                imageUser: UIImage(named: "12miho") ?? UIImage(),
                userComment: "12miho появилась(-ась) в RMLink. Вы можете быть знакомы 3д."
            )
        ]),
        .subscribe([
            ModelSubscribeCell(
                imageUser: UIImage(named: "otherUserImage") ?? UIImage(),
                userComment: "lavanda123 \nподписался(-ась) на ваши новости 5д."
            )
        ]),
        .comment([
            ModelCommentCell(
                userImage: UIImage(named: "otherUserImage") ?? UIImage(),
                userText: "lavanda123 понравился ваш комментарий: 'Ты вернулась?' 7д.",
                image: UIImage(named: "imageComments") ?? UIImage()
            )
        ]),
        .subscribe([
            ModelSubscribeCell(
                imageUser: UIImage(named: "marks") ?? UIImage(),
                userComment: "markS появилась(-ась) в RMLink. Вы можете быть знакомы 8д."
            )
        ]),
        .subscribe([
            ModelSubscribeCell(
                imageUser: UIImage(named: "sv_neit") ?? UIImage(),
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
        tableView.register(CommentCell.self, forCellReuseIdentifier: "CommentCell")
        tableView.register(SubscribeCell.self, forCellReuseIdentifier: "SubscribeCell")
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

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
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
                ) as? CommentCell else { fatalError() }
                guard let comment = comments.first else { fatalError() }
                commentCell.configure(with: comment)
                return commentCell

            case let .subscribe(subscribe):
                guard let commentCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell else { fatalError() }
                guard let subscribeItem = subscribe.first else { fatalError() }
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
                ) as? CommentCell else { fatalError() }
                guard let comment = comments.first else { fatalError() }
                subscribeCell.configure(with: comment)
                return subscribeCell

            case let .subscribe(subscribe):
                guard let subscribeCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell else { fatalError() }
                guard let subscribeItem = subscribe.first else { fatalError() }
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
        if section == 0 {
            label.text = Constants.todayTitle
        } else {
            label.text = Constants.onWeekTitle
        }
        return label
    }
}
