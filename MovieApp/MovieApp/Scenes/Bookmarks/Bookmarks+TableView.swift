//
//  Bookmarks+Constraints.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 22.06.2022.
//

import UIKit

extension BookmarksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let bookmarks = viewModel.getMovies() else {return 0}
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.bookmarksTableViewIdentifier, for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        tableView.backgroundColor = .black
        
        if let bookmarkMovies = viewModel.getMovies(){
            cell.configureBookmarks(movie: bookmarkMovies[indexPath.row])
            cell.row = indexPath.row
        }
        
        return cell
    }
}
