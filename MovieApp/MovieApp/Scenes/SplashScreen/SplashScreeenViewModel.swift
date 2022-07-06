//
//  SplashScreeenViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 6.07.2022.
//

import Foundation

class SplashScreenViewModel {
    
    func fetchData(completion: @escaping (Bool)->Void){
        let movieUrl = NetworkConstants.Urls.fetchUpComingMoviesURL()
        MovieService.shared.fetchMovie(urlString: movieUrl) { result in
            switch result {
            case .success(let movieList):
                MainData.shared.movies = movieList
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
        
        let genreUrl = NetworkConstants.Urls.fetchGenreListURL()
        GenreService.shared.fetchGenre(urlString: genreUrl) { result in
            switch result {
            case .success(let genreList):
                MainData.shared.genres = genreList
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
}
