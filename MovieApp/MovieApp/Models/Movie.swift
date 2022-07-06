//
//  Movie.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

struct Movies: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let vote_average: Float
    let release_date: String
    let poster_path: String
    let genre_ids: [Int]
}
