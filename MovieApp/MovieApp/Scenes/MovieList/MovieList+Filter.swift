//
//  MovieList+Filter.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 25.06.2022.
//

import UIKit

extension MovieListViewController {
    
    @objc func  movieFilter() {
        
        let genres = viewModel.getGenres()
        let alert = UIAlertController(title: "Filter", message: nil, preferredStyle: .actionSheet)
        
        let All = UIAlertAction(title: "All", style: .default, handler: {(_) in
            self.viewModel.getAllMovies()
            self.reloadData()
        })
        alert.addAction(All)
        
        for genre in genres {
            let Button = UIAlertAction(title: genre.name, style: .default, handler: {(_) in
                self.viewModel.filteredMovies(id: genre.id)
                self.reloadData()
            })
            alert.addAction(Button)
        }
    self.present(alert, animated: true)
    }
}

