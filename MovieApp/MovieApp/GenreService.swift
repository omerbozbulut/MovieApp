//
//  GenreService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

class GenreService {
    
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
                completion(.failure(.moviesNotFound))
                return
            }
            if let movieData = self.parseJSON(safeData) {
                completion(.success(movieData))
            }
        }
        task.resume()
    }
    
    func parseJSON(_ genreData : Data)->[Genre]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Genres.self, from: genreData)
            let genres = decodedData.genres
                return genres
        } catch{
            return nil
        }
    }
}

enum GenreNetworkError: Error {
    case taskError
    case badURL
    case moviesNotFound
}
