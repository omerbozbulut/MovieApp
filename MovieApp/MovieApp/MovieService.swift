//
//  KingfisherService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation


typealias getMovie = ([Movie]?, String) -> Void

class MovieService {
    
    var errorMessage = ""
    var movies: [Movie] = []
    
    func performMovieRequest(urlString: String, completion: @escaping getMovie) {
        guard let url = URL(string: urlString) else {return}
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { [weak self] (data, responce, error) in
            if let error = error {
                self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if let safeData = data,
                      let response = responce as? HTTPURLResponse,
                      response.statusCode == 200 {
                
                if let movieData = self?.parseJSON(safeData){
                    completion(movieData, self?.errorMessage ?? "")
                }
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
