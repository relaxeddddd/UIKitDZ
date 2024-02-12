// PersonsBirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс PersonsBirthdayViewController который показывает дни рождения пользователей
final class PersonsBirthdayViewController: UIViewController {
    // MARK: - Public Properties

    public var delegate: PersonInfoViewControllerDelegate?

    // MARK: - Private Properties

    private var people: [PersonInfo] = [
        PersonInfo(
            personImage: "person1",
            personName: "Helena Link",
            personDateOfBirthday: "10.03 - turns 25!",
            daysBeforeBirthday: ""
        ),
        PersonInfo(
            personImage: "person2",
            personName: "Verona Tusk",
            personDateOfBirthday: "20.03 - turns 39!",
            daysBeforeBirthday: "10 days"
        ),
        PersonInfo(
            personImage: "person3",
            personName: "Alex Smith",
            personDateOfBirthday: "21.04 - turns 51!",
            daysBeforeBirthday: "42 days"
        ),
        PersonInfo(
            personImage: "person4",
            personName: "Tom Johnson",
            personDateOfBirthday: "05.06 - turns 18!",
            daysBeforeBirthday: "87 days"
        )
    ] {
        didSet {
            addPerson()
        }
    }

    private let cackeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cacke")
        image.frame = CGRect(x: 310, y: 165, width: 45, height: 45)
        return image
    }()

    private let personView = PersonsBirthdayViewViewController()

    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedButton))
        navigationItem.rightBarButtonItem = rightBarItem
        navigationItem.title = "Birthday Reminder"
        addPerson()
        view.addSubview(personView.todayLabel)
        view.addSubview(personView.nextWeek)
        view.addSubview(personView.nextMonth)
        view.addSubview(personView.nextYear)
        view.addSubview(cackeImage)
    }

    /// Функция которая создает пользователя
    private func createUsersView(person: PersonInfo, coordinateY: Int) {
        let personViews = PersonsBirthdayViewViewController()
        personViews.personImage.image = UIImage(named: person.personImage)
        personViews.nameOfPerson.text = person.personName
        personViews.personDateOfBirthday.text = person.personDateOfBirthday
        personViews.daysBefore.text = person.daysBeforeBirthday
        personViews.frame = CGRect(x: 20, y: coordinateY, width: 350, height: 100)
        if person.personName == "Helena Link" {
            personViews.backgroundColor = UIColor(red: 253 / 255, green: 238 / 255, blue: 246 / 255, alpha: 1.0)
        } else {
            personViews.backgroundColor = UIColor(red: 182 / 255, green: 171 / 255, blue: 207 / 255, alpha: 1.0)
        }
        view.addSubview(personViews)
    }

    /// Функция которая добавляет пользователя
    private func addPerson() {
        var coordinateY = 140
        for person in people {
            createUsersView(person: person, coordinateY: coordinateY)
            coordinateY += 140
        }
        view.addSubview(cackeImage)
    }

    /// Презент окна
    @objc private func tappedButton() {
        let secondViewController = PersonInfoViewController()
        secondViewController.delegate = self
        present(secondViewController, animated: true)
    }
}

extension PersonsBirthdayViewController: PersonInfoViewControllerDelegate {
    func transferOfInformation(person: PersonInfo) {
        people.append(person)
    }
}
