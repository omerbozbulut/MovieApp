//
//  NetworkConstants.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

struct NetworkConstants {
    static let BASE_URL = "https://api.themoviedb.org"
    static let KEY = "f7e4d60f9116a60ca46ab131ae2d83ad"
    static let IMAGE_URL = "https://image.tmdb.org"
    
    struct Urls {
    
        static func fetchUpComingMoviesURL()->String{
            let url = "\(NetworkConstants.BASE_URL)/3/movie/upcoming?api_key=\(NetworkConstants.KEY)&language=en-US&page=1"
            return url
        }
        
        static func fetchSearchMovieURL(name: String)->String{
            let url = "\(NetworkConstants.BASE_URL)/3/search/movie?api_key=\(NetworkConstants.KEY)&language=en-US&query=\(name)&page=1&include_adult=false"
            return url
        }
        
        static func fetchGenreListURL()->String{
            let url = "\(NetworkConstants.BASE_URL)/3/genre/movie/list?api_key=\(NetworkConstants.KEY)&language=en-US"
            return url
        }
        
        static func fetchMovieImageURL(path: String)->String{
            let url = "\(NetworkConstants.IMAGE_URL)/t/p/w500\(path)"
            return url
        }
    }
    
}
