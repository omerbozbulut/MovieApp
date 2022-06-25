//
//  MovieList+Extensions.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

extension MovieListViewController: Update {
    func getData(_ movieData: [Movie]) {
        movies = movieData
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
