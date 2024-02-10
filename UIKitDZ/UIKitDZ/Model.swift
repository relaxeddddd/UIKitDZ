// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель нашейго плейлиста
struct Track {
    let title: String
    let nameOfSong: String
    let imgName: String
    let duration: String
}

class PlayList {
    static let trak1 = Track(
        title: "ALBLAK 52",
        nameOfSong: "YEEI 5",
        imgName: "trackImage1",
        duration: "2:27"
    )
    static let trak2 = Track(
        title: "ALBLAK 52",
        nameOfSong: "Winter Sheet",
        imgName: "trackImage2",
        duration: "1:53"
    )
}
