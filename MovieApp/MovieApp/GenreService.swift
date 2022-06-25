//
//  GenreService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import Foundation

protocol UpdateGenre {
    func getData(_ genreData: [Genre])
}

class GenreService {
    
    var delegate: UpdateGenre?
    
    func performGenreRequest(urlString: String){
        guard let url = URL(string: urlString) else {return}
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { (data, responce, error) in
            if error != nil{
                return
            }
            if let safeData = data {
                if let genreData = self.parseJSON(safeData){
                    self.delegate?.getData(genreData)
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
