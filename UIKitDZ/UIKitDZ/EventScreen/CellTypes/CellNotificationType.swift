// CellNotificationType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// Перечисление с типами ячеек
enum CellNotificationType {
    case comment([CommentItemCell])
    case subscribe([SubscribeItemCell])
}
