//
//  TableCellViewModel.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation



class TableCellViewModel {

    private var bookmarks = [Movie]()
    private var movieList = movies
    
    func updateUserDefaults() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(bookmarks), forKey: "Movie")
    }
    
    func setBookmarks()->[Movie]{
         if let data = UserDefaults.standard.value(forKey: "Movie") as? Data {
            if let bookmarksList = try? PropertyListDecoder().decode(Array<Movie>.self, from: data){
                return bookmarksList
            }
        }
         return [Movie]()
    }
    
    func addBookmark(_ row: Int){
        bookmarks = setBookmarks()
        bookmarks.append(movieList[row])
        updateUserDefaults()
    }
    
    func getBookmarks(_ row: Int)->Movie{
        bookmarks = setBookmarks()
        return bookmarks[row]
    }
}
