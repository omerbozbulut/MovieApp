//
//  MovieService2.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 8.07.2022.
//

import Foundation

class MovieService {
    
    static let shared = MovieService()
    
    init(){}
 
    func fetchMovie(urlString: String, completion: @escaping (Result<[Movie], MovieNetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        WebSerice.shared.fetchData(of: Movies.self, url: url) { result in
            switch result {
            case .success(let movieList):
                completion(.success(movieList.results))
            case .failure(_):
                print(result)
                completion(.failure(.moviesNotFound))
            }
        }
        
    }
    
    enum MovieNetworkError: Error {
        case badURL
        case moviesNotFound
    }
}
