//
//  MovieService2.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 29.06.2022.
//

import Foundation

class MovieService {
    
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
            if let movieData = self.parseJSON(safeData) {
                completion(.success(movieData))
            }
        }
        task.resume()
    }
    
    func parseJSON(_ movieData : Data)->[Movie]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Movies.self, from: movieData)
            let movies = decodedData.results
                return movies
        } catch{
            return nil
        }
    }
}

enum MovieNetworkError: Error {
    case taskError
    case badURL
    case moviesNotFound
}
