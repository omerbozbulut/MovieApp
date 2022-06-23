//
//  BookmarksViewController.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 22.06.2022.
//

import UIKit

class BookmarksViewController: UIViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 144
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: Constants.bookmarksTableViewIdentifier)
        tableView.separatorColor = .black
        return tableView
    }()
    
    let viewModel = BookmarksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}
