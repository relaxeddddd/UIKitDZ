// UserInfo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс UserInfo для хранения данных(синглтон)
class UserInfo {
    static let shared = UserInfo()

    var login: String?
}
