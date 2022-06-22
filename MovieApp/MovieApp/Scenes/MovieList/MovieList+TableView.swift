//
//  MovieList+TableView.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation
import UIKit

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewIdentifier, for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        let movie = movieListViewModel.movies[indexPath.row]
        cell.configureMovie(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = UIViewController()
        //destinationVC.row = indexPath.row
        present(destinationVC, animated: true, completion: nil)
    }
    
}
