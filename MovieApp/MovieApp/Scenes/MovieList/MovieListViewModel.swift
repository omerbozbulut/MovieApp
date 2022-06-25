//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

class MovieListViewModel{
    
    private var movieList = movies
    
    func getMovies()->[Movie]{
        movieList = movies
        return movieList
    }
}
