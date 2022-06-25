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
        movieList = movies
        return movieList
    }
    
    func getGenres()->[Genre]{
        genreList = genres
        return genreList
    }
    
    func filteredMovies(id: Int){
        let filtered = movieList.filter { movie in
            let ids =  movie.genre_ids.filter { genre in
                return genre == id ? true : false
            }
            if !ids.isEmpty{
                return true
            }
            return false
        }
        movies = filtered
    }
}
