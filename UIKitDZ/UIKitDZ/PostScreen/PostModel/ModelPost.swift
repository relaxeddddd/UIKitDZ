// ModelPost.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Модель для ячейки постов
struct Post {
    // Ававтарка пользователя
    let imageUser: UIImage
    // Имя пользователя
    let username: String
    // Изображение в посте
    let postImage: [UIImage]
    // Количество лайков
    let numberLikes: String
    // Коментарий пользователя
    let userComent: String
    // Время поста
    let time: String
}
