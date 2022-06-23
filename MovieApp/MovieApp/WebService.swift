//
//  KingfisherService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

class WebService {
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    var flag = false
    
    func performRequest(urlString: String, completionHandler: CompletionHandler) {
        guard let url = URL(string: urlString) else {return}
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { (data, responce, error) in
            if error != nil{
                return
            }
            if let safeData = data {
                if let moviesData = self.parseJSON(safeData){
                    self.flag = true
                    movies = moviesData
                }
            }
        }
        task.resume()
        completionHandler(flag)
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
