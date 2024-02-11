// PersonView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс PersonView для заполнения UIView данными экрана дня рождений пользователей
class PersonView: UIView {
    // MARK: - Public Properties

    public let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .black
        return label
    }()

    public let nextWeek: UILabel = {
        let label = UILabel()
        label.text = "Neext Week"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .black
        return label
    }()

    public let newxtMonth: UILabel = {
        let label = UILabel()
        label.text = "Next Month"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .black
        return label
    }()

    public let newxtYear: UILabel = {
        let label = UILabel()
        label.text = "June 2024"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .black
        return label
    }()

    public let nameOfPerson: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    public let personDateOfBirthday: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    public let personImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    public let daysBefore: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()

    public let cackeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cacke")
        return image
    }()

    // MARK: - Initializers

    init(
        frame: CGRect = .zero,
        name: String = "",
        dateOfBirthday: String = "",
        image: UIImage? = nil,
        backgroundColor: UIColor? = nil,
        daysBeforeBirth: String = "",
        daysBeforeBirthdayColor: UIColor? = nil
    ) {
        super.init(frame: frame)
        nameOfPerson.text = name
        personDateOfBirthday.text = dateOfBirthday
        personImage.image = image
        daysBefore.text = daysBeforeBirth
        daysBefore.textColor = daysBeforeBirthdayColor
        self.backgroundColor = backgroundColor
        setUpSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Life Cicle

    //  Расположение элементов
    override func layoutSubviews() {
        super.layoutSubviews()
        nameOfPerson.frame = CGRect(x: 100, y: 20, width: 250, height: 30)
        personDateOfBirthday.frame = CGRect(x: 100, y: 50, width: 250, height: 30)
        personImage.frame = CGRect(x: 10, y: 10, width: 75, height: 75)
        daysBefore.frame = CGRect(x: 290, y: 25, width: 45, height: 45)

        addSubviewInView(nameSubvieu: nameOfPerson)
        addSubviewInView(nameSubvieu: personDateOfBirthday)
        addSubviewInView(nameSubvieu: personImage)
        addSubviewInView(nameSubvieu: daysBefore)
    }

    // MARK: - Private Methods

    private func setUpSubviews() {
        addSubview(nameOfPerson)
        addSubview(personDateOfBirthday)
        addSubview(personImage)
        addSubview(daysBefore)
        layer.cornerRadius = 12
    }

    /// Установка  элементов в пределах UIView
    private func addSubviewInView(nameSubvieu: UIView) {
        if !bounds.contains(nameSubvieu.frame) {
            nameSubvieu.frame.origin.x = max(
                0,
                min(nameSubvieu.frame.origin.x, bounds.width - nameSubvieu.frame.width)
            )
            nameSubvieu.frame.origin.y = max(
                0,
                min(nameSubvieu.frame.origin.y, bounds.height - nameSubvieu.frame.height)
            )
        }
    }
}
