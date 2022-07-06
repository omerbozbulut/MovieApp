//
//  GenreService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

class GenreService {
    
    static let shared = GenreService()
    
    init(){}
    
    func fetchGenre(urlString: String, completion: @escaping (Result<[Genre], GenreNetworkError>)->Void) {
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
                completion(.failure(.genreNotFound))
                return
            }
            
            BaseService.shared.parseJSON(type: Genres.self, data: safeData) { result in
                switch result {
                case .success(let genreList):
                    completion(.success(genreList.results))
                case .failure(_):
                    completion(.failure(.genreNotFound))
                }
            }
        }
        task.resume()
    }
}

enum GenreNetworkError: Error {
    case taskError
    case badURL
    case genreNotFound
}
