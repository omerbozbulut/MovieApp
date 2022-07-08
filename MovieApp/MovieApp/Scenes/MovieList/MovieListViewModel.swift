//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

class MovieListViewModel{
    private let movieService = MovieService()
    
    private var genreList = MainData.shared.genres
    private var movieList = MainData.shared.movies
    
    var refresh: (() -> Void)?
    
    func getMovies()->[Movie]{
        return movieList
    }
    
    func getAllMovies(){
        movieList = MainData.shared.movies
    }
    
    func getGenres()->[Genre]{
        genreList = MainData.shared.genres
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
    
    func searchedMovies(movieData: [Movie]){
        movieList = movieData
    }
    
    func fetchData(text: String){
        if text.isEmpty {
            getAllMovies() // get singleton data
        }
        else {
            let url = NetworkConstants.Urls.fetchSearchMovieURL(name: text)
            movieService.fetchMovie(urlString: url) { result in
                switch result {
                case .success(let movieList):
                    self.searchedMovies(movieData: movieList)
                case .failure(let error):
                    print(error)
                }
            }
        }
        refresh?()
    }
}
