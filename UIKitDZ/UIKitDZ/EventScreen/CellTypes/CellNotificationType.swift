// CellNotificationType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Перечисление с типами ячеек
enum CellNotificationType {
    /// Кейс для ячейки коментария
    case comment([CommentItemCell])
    /// Кейс для чейки с кнопкой подписаться
    case subscribe([SubscribeItemCell])
}
