//
//  MovieService2.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 29.06.2022.
//

import Foundation

class MovieService {
    
    static let shared = MovieService()
    
    init(){}
    
    func fetchMovie(urlString: String, completion: @escaping (Result<[Movie], MovieNetworkError>)->Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { (data, responce, error) in
            if error != nil {
                completion(.failure(.taskError))
            }
            
            guard let safeData = data else {
                completion(.failure(.moviesNotFound))
                return
            }
            
            BaseService.shared.parseJSON(type: Movies.self, data: safeData) { result in
                switch result {
                case .success(let movieList):
                    completion(.success(movieList.results))
                case .failure(_):
                    completion(.failure(.moviesNotFound))
                }
            }
        }
        task.resume()
    }
    
    
}

enum MovieNetworkError: Error {
    case taskError
    case badURL
    case moviesNotFound
}
