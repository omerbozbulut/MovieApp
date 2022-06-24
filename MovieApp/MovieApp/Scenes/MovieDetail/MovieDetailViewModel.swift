//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 24.06.2022.
//

import Foundation

class MovieDetailViewModel{
    
    var movieList = movies
    
    func getMovies()->[Movie]{
        return movieList
    }
}
