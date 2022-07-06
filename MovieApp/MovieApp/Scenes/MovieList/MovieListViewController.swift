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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure(){
        view.addSubview(filterButton)
        view.addSubview(tableView)
        view.backgroundColor = .black
        
        configureConstraints()
        navigationItem.searchController = searchController
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
        present(alert, animated: false)
    }
}

//MARK: - Search Movie
extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.searchTextField.textColor = .white
        guard let text = searchController.searchBar.text else {return}
        
        viewModel.fetchData(text: text)
        reloadData()
    }
}
