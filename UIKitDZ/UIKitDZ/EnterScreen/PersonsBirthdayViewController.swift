// EnterViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс ViewController
class PersonsBirthdayViewController: UIViewController {
    let personView = PersonView()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Controller")
        view.backgroundColor = .white
        addViews()
    }

    private func addViews() {
        let firstPerson = PersonView(
            frame: CGRect(x: 20, y: 130, width: 350, height: 95),
            name: Person.person2.personName,
            dateOfBirthday: Person.person1.personDateOfBirthday,
            image: UIImage(named: Person.person1.personImage),
            backgroundColor: UIColor(red: 253 / 255, green: 238 / 255, blue: 246 / 255, alpha: 1.0),
            daysBeforeBirth: Person.person1.daysBeforeBirthday,
            daysBeforeBirthdayColor: UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1.0)
        )

        let twicePerson = PersonView(
            frame: CGRect(x: 20, y: 275, width: 350, height: 95),
            name: Person.person2.personName,
            dateOfBirthday: Person.person2.personDateOfBirthday,
            image: UIImage(named: Person.person2.personImage),
            backgroundColor: UIColor(red: 182 / 255, green: 171 / 255, blue: 207 / 255, alpha: 1.0),
            daysBeforeBirth: Person.person2.daysBeforeBirthday,
            daysBeforeBirthdayColor: UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1.0)
        )

        let thirdPerson = PersonView(
            frame: CGRect(x: 20, y: 420, width: 350, height: 95),
            name: Person.person3.personName,
            dateOfBirthday: Person.person3.personDateOfBirthday,
            image: UIImage(named: Person.person3.personImage),
            backgroundColor: UIColor(red: 182 / 255, green: 171 / 255, blue: 207 / 255, alpha: 1.0),
            daysBeforeBirth: Person.person3.daysBeforeBirthday,
            daysBeforeBirthdayColor: UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1.0)
        )

        let fourthPerson = PersonView(
            frame: CGRect(x: 20, y: 565, width: 350, height: 95),
            name: Person.person4.personName,
            dateOfBirthday: Person.person4.personDateOfBirthday,
            image: UIImage(named: Person.person4.personImage),
            backgroundColor: UIColor(red: 182 / 255, green: 171 / 255, blue: 207 / 255, alpha: 1.0),
            daysBeforeBirth: Person.person4.daysBeforeBirthday,
            daysBeforeBirthdayColor: UIColor(red: 90 / 255, green: 67 / 255, blue: 148 / 255, alpha: 1.0)
        )
        view.addSubview(firstPerson)
        view.addSubview(twicePerson)
        view.addSubview(thirdPerson)
        view.addSubview(fourthPerson)
        view.addSubview(personView.todayLabel)
        view.addSubview(personView.nextWeek)
        view.addSubview(personView.newxtMonth)
        view.addSubview(personView.newxtYear)
        view.addSubview(personView.cackeImage)
        personView.todayLabel.frame = CGRect(x: 20, y: 100, width: 200, height: 20)
        personView.nextWeek.frame = CGRect(x: 20, y: 245, width: 200, height: 20)
        personView.newxtMonth.frame = CGRect(x: 20, y: 390, width: 200, height: 20)
        personView.newxtYear.frame = CGRect(x: 20, y: 535, width: 200, height: 20)
        personView.cackeImage.frame = CGRect(x: 310, y: 155, width: 44, height: 44)
    }
}
