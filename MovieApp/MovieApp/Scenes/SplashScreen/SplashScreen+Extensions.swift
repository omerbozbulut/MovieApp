//
//  SplashScreen+Extensions.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import UIKit

//MARK: - GET DATA FROM API
extension SplashScreenViewController: Update{
    func getData(_ movieData: [Movie]) {
        movies = movieData
    }
}
