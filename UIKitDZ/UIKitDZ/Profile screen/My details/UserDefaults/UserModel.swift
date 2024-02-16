// UserModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

// Модель для информации с юзером
struct User {
    @UserDefault("name", defaultValue: "")
    static var name: String

    @UserDefault("surname", defaultValue: "")
    static var surname: String

    @UserDefault("number", defaultValue: "")
    static var number: String

    @UserDefault("sizeFoot", defaultValue: "")
    static var sizeFoot: String

    @UserDefault("birthday", defaultValue: "")
    static var birthday: String

    @UserDefault("email", defaultValue: "")
    static var email: String
}
