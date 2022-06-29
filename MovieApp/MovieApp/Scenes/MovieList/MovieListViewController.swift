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
        button.addTarget(self, action: #selector(movieFilter), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 144
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: Constants.movieListTableViewIdentifier)
        tableView.separatorColor = .black
        return tableView
    }()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        return searchController
    }()
    
    let viewModel = MovieListViewModel()
    private let movieService = MovieService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configure()
    }
    
    private func configure(){
        view.addSubview(filterButton)
        view.addSubview(tableView)
        view.backgroundColor = .black
        
        configureConstraints()
    }
    
    func reloadData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func errorAlert(errorMessage: String){
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .actionSheet)
        let error = UIAlertAction(title: "Error", style: .default, handler: nil)
        alert.addAction(error)
    }
}

//MARK: - Search Movie
extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.searchTextField.textColor = .white
        guard let text = searchController.searchBar.text else {return}
        
        var url = ""
        
        if !text.isEmpty {
            url = NetworkConstants.Urls.fetchSearchMovieURL(name: text)
        }
        else {
            url = NetworkConstants.Urls.fetchUpComingMoviesURL()
        }
        movieService.fetchMovie(urlString: url) { result in
            switch result {
            case .success(let movieList):
                movies = movieList
                self.viewModel.getAllMovies()
                self.reloadData()
            case .failure(let error):
                self.errorAlert(errorMessage: error.localizedDescription)
            }
        }
    }
}
