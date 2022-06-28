//
//  GenreService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

typealias getGenre = ([Genre]?, String) -> Void

class GenreService {
    
    var errorMessage = ""
    var genres: [Genre] = []
    
    func performGenreRequest(urlString: String, completion: @escaping getGenre){
        guard let url = URL(string: urlString) else {return}
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { [self] (data, responce, error) in
            if let error = error {
                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if let safeData = data,
                      let response = responce as? HTTPURLResponse,
                      response.statusCode == 200 {
                
                if let genreData = self.parseJSON(safeData){
                    completion(genreData, errorMessage)
                }
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
