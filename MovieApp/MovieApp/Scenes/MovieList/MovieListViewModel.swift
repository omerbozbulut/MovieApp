//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

class MovieListViewModel{
    
    private var genreList = genres
    private var movieList = movies
    
    func getMovies()->[Movie]{
        return movieList
    }
    
    func getAllMovies(){
        movieList = movies
    }
    
    func getGenres()->[Genre]{
        genreList = genres
        return genreList
    }
    
    func filteredMovies(id: Int) {  // filter by genre
        getAllMovies()
        let filtered = getMovies().filter { movie in
            let ids =  movie.genre_ids.filter { genre in
                return genre == id
            }
            if !ids.isEmpty{
                return true
            }
            return false
        }
        movieList = filtered
    }
}
