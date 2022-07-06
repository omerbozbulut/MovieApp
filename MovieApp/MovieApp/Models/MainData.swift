//
//  MainData.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 6.07.2022.
//

import Foundation

class MainData {
    static let shared = MainData()
    
    init(){}
    
    var movies = [Movie]()
    var genres = [Genre]()

}
