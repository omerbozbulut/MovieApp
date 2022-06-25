//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import UIKit

class MovieListViewController: UIViewController {
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .left
        button.setTitle("Filter", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 144
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: Constants.movieListTableViewIdentifier)
        tableView.separatorColor = .black
        return tableView
    }()
    
    let searchContoller = UISearchController()
    
    let movieListViewModel = MovieListViewModel()
    var service = WebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchContoller.searchResultsUpdater = self
        navigationItem.searchController = searchContoller
        
        tableView.delegate = self
        tableView.dataSource = self
        service.delegate = self
        configure()
    }
    
    private func configure(){
        view.addSubview(filterButton)
        view.addSubview(tableView)
        view.backgroundColor = .black
        
        configureConstraints()
    }
}

//MARK: - Search Movie
extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.searchTextField.textColor = .white
        guard let text = searchController.searchBar.text else {return}
        if !text.isEmpty {
            let url = NetworkConstants.Urls.fetchSearchMovieURL(name: text)
            service.performRequest(urlString: url)
        }
        else {
            let url = NetworkConstants.Urls.fetchUpComingMoviesURL()
            service.performRequest(urlString: url)
        }
    }
}
