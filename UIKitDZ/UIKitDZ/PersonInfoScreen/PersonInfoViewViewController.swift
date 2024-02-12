// PersonInfoViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс PersonInfoViewViewController для создания view's для PersonInfoViewController
class PersonInfoViewViewController: UIView {
    // MARK: - Public Properties

    public var cancleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancle", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 20, y: 20, width: 60, height: 20)
        return button
    }()

    public var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame = CGRect(x: 320, y: 20, width: 60, height: 20)
        return button
    }()

    public var imagePerson: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emptyImage")
        image.frame = CGRect(x: 140, y: 80, width: 125, height: 125)
        return image
    }()

    public var changePhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Change photo"
        label.textColor = .systemBlue
        label.font = UIFont(name: "Verdana", size: 16)
        label.frame = CGRect(x: 145, y: 215, width: 120, height: 20)
        return label
    }()

    /// Surname views
    public var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Surname"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 260, width: 200, height: 20)
        return label
    }()

    public var nameSurnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Name Surname"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 290, width: 345, height: 20)
        return textField
    }()

    public var lineSurName: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.frame = CGRect(x: 20, y: 315, width: 345, height: 1)
        return line
    }()

    /// Birthday views
    public var birthdayLable: UILabel = {
        let label = UILabel()
        label.text = "Birthday"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 340, width: 200, height: 20)
        return label
    }()

    public var birthdayTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Date of Birthday"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 370, width: 345, height: 20)
        return textField
    }()

    public var lineBirthday: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.frame = CGRect(x: 20, y: 395, width: 345, height: 1)
        return line
    }()

    /// Age
    public var ageLable: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 420, width: 200, height: 20)
        return label
    }()

    public var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing age"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 450, width: 345, height: 20)
        return textField
    }()

    public var lineAge: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.frame = CGRect(x: 20, y: 475, width: 345, height: 1)
        return line
    }()

    /// Gender
    public var genderLable: UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 500, width: 200, height: 20)
        return label
    }()

    public var genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Indicate Gender"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 530, width: 345, height: 20)
        return textField
    }()

    public var lineGender: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.frame = CGRect(x: 20, y: 555, width: 345, height: 1)
        return line
    }()

    /// Telegram
    public var telegramLable: UILabel = {
        let label = UILabel()
        label.text = "Telegram"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 580, width: 200, height: 20)
        return label
    }()

    public var telegramTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing Telegram"
        textField.font = UIFont(name: "Verdana", size: 14)
        textField.frame = CGRect(x: 20, y: 610, width: 345, height: 20)
        return textField
    }()

    public var lineTelegram: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.frame = CGRect(x: 20, y: 635, width: 345, height: 1)
        return line
    }()
}
