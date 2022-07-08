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
 
    func fetchGenre(urlString: String, completion: @escaping (Result<[Genre], GenreNetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        
        WebSerice.shared.fetchData(of: Genres.self, url: url) { result in
            switch result {
            case .success(let genreList):
                completion(.success(genreList.genres))
            case .failure(_):
                completion(.failure(.moviesNotFound))
            }
        }
        
    }
    
    enum GenreNetworkError: Error {
        case badURL
        case moviesNotFound
    }
}
