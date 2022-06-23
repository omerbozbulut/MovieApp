//
//  BookmarksViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 23.06.2022.
//

import Foundation

class BookmarksViewModel {
    
    func getMovies()->[Movie]?{
         if let data = UserDefaults.standard.value(forKey: "Movie") as? Data {
            if let bookmarksList = try? PropertyListDecoder().decode(Array<Movie>.self, from: data){
                return bookmarksList
            }
        }
         return nil
    }
    
}
