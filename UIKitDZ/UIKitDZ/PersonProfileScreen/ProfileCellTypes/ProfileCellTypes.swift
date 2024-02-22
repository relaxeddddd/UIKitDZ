// ProfileCellTypes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

enum ProfileCellTypes {
    /// Кейс для ячейки информации профиля
    case profileInformation(ProfileInformation)
    /// Кейс для ячейки историй профиля
    case stories([ProfileStories])
    /// Кейс для ячейки постов
    case posts
}
