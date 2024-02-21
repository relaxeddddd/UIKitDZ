// CellType.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Перечисление с типом ячеек для такблицы
enum CellType {
    // Кейс для ячейки историй
    case stories([Stories])
    // Кейс для ячейки постов
    case post([Post])
    // Кейс для ячейки рекомендаций
    case recomendation([Recomendation])
}
