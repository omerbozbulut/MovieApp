//
//  TableCellViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

struct TableCellViewModel {
    
    func getMovie(row: Int)->Movie {
        //let movie = Movie(title: "prestij", overview: "müko film", vote_average: 4.8, release_date: "22.01.2012", poster_path: "photo")
        
        let movie = movies[row]
        return movie
    }
}
