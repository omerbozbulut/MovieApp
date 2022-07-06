//
//  Genre.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

struct Genres: Codable {
    let results: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}
