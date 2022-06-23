//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import UIKit

class MovieListViewController: UIViewController {
  
    let searchTextField: UITextField = {
        let search = UITextField()
        search.textColor = .white
        search.backgroundColor = .darkGray
        search.tintColor = .white
        search.layer.masksToBounds = true
        search.layer.cornerRadius = 5
        search.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor.white])
        search.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: search.frame.height))
        search.leftViewMode = UITextField.ViewMode.always
        search.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return search
    }()
    
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
    
    let movieListViewModel = MovieListViewModel()
    var service = WebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        configure()
    }
    
    private func configure(){
        view.addSubview(searchTextField)
        view.addSubview(filterButton)
        view.addSubview(tableView)
        view.backgroundColor = .black
        
        configureConstraints()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else {return}
        
        let url:String
        
        if !text.isEmpty {
            url = NetworkConstants.Urls.fetchSearchMovieURL(name: text)
        }
        else {
            url = NetworkConstants.Urls.fetchUpComingMoviesURL()
        }
        
        service.performRequest(urlString: url, completionHandler: { (success) -> Void in
            if success{
                tableView.reloadData()
            }else{
                print("Download Error")
            }
        })
    }
}

