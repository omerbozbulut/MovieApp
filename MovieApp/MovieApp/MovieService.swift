//
//  KingfisherService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

protocol UpdateMovie {
    func getData(_ movieData: [Movie])
}

class MovieService {
    
    var delegate: UpdateMovie?
    
    func performMovieRequest(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { (data, responce, error) in
            if error != nil{
                return
            }
            if let safeData = data {
                if let moviesData = self.parseJSON(safeData){
                    self.delegate?.getData(moviesData)
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
