//
//  MovieList+Extensions.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

extension MovieListViewController: UpdateMovie {
    func getData(_ movieData: [Movie]) {
        movies = movieData
        reloadData()
    }
}
