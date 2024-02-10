// PersonModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

struct PersonInfo {
    var personImage: String
    var personName: String
    var personDateOfBirthday: String
    var daysBeforeBirthday: String
}

class Person {
    static var person1 = PersonInfo(
        personImage: "person1",
        personName: "Helena Link",
        personDateOfBirthday: "10.03 - turns 25!",
        daysBeforeBirthday: ""
    )

    static var person2 = PersonInfo(
        personImage: "person2",
        personName: "Verona Tusk",
        personDateOfBirthday: "20.03 - turns 39!",
        daysBeforeBirthday: "10 days"
    )

    static var person3 = PersonInfo(
        personImage: "person3",
        personName: "Alex Smith",
        personDateOfBirthday: "21.04 - turns 51!",
        daysBeforeBirthday: "42 days"
    )

    static var person4 = PersonInfo(
        personImage: "person4",
        personName: "Tom Johnson",
        personDateOfBirthday: "05.06 - turns 18!",
        daysBeforeBirthday: "87 days"
    )
}
