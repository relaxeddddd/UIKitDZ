// ModelPost.swift
// Copyright © RoadMap. All rights reserved.

/// Модель для ячейки постов
struct Post {
    /// Ававтарка пользователя
    let imageUserName: String
    /// Имя пользователя
    let username: String
    /// Изображение в посте
    let postImageName: [String]
    /// Количество лайков
    let numberLikes: String
    /// Коментарий пользователя
    let userComent: String
    /// Время поста
    let time: String
}
