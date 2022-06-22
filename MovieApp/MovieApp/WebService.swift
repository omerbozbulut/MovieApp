//
//  KingfisherService.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

protocol WebProtocol {
    func getData(movies: [Movie])
}

struct WebService {
    
    var delegate: WebProtocol?
    
    func performRequest(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { (data, responce, error) in
            if error != nil{
                return
            }
            if let safeData = data {
                if let moviesData = parseJSON(safeData){
                    delegate?.getData(movies: moviesData)
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



/*
 Detail e koy
 
 func configureNavigation(){
     let backbutton = UIButton(type: .custom)
     backbutton.setImage(UIImage(systemName: "arrow.backward.square"), for: .normal)
     backbutton.setTitle("Back", for: .normal)
     backbutton.setTitleColor(.black, for: .normal)
         backbutton.addTarget(self, action: "backAction", forControlEvents: .TouchUpInside)
     
 }
 
 @objc func
 
 */
