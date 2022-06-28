//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 22.06.2022.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    let image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: Constants.SymbolNames.starSymbolName)
        image.tintColor = .systemYellow
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.textAlignment = .left
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = UIFont(name: Constants.Fonts.TrebuchetMSBold, size: 20)
        return title
    }()
    
    let overview: UILabel = {
        let overview = UILabel()
        overview.textColor = .white
        overview.lineBreakMode = .byWordWrapping
        overview.numberOfLines = 0
        return overview
    }()
    
    let vote: UILabel = {
        let vote = UILabel()
        vote.textColor = .systemYellow
        vote.font = UIFont(name: Constants.Fonts.helvetica, size: 18)
        return vote
    }()
    
    let releaseDate: UILabel = {
        let date = UILabel()
        date.textColor = .white
        date.font = UIFont(name: Constants.Fonts.helveticaMedium, size: 17)
        return date
    }()
    
    private let viewModel = MovieDetailViewModel()
    private var row = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    init(_ row: Int){
        super.init(nibName: nil, bundle: nil)
        self.row = row
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        view.addSubview(image)
        view.addSubview(titleLabel)
        view.addSubview(overview)
        view.addSubview(starImage)
        view.addSubview(vote)
        view.addSubview(releaseDate)
        
        navBarConfigure()
        configureConstraints()
        configureMovie()
    }
    
    func configureMovie(){
        let movie = viewModel.getMovies()[row]
        image.kf.setImage(with: URL(string: NetworkConstants.Urls.fetchMovieImageURL(path:  movie.poster_path)))
        titleLabel.text = movie.title
        overview.text = movie.overview
        vote.text = "\(movie.vote_average)/10"
        releaseDate.text = "Release date: \(movie.release_date)"
    }
    
    func navBarConfigure(){
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(systemName: Constants.SymbolNames.chevronBackward), for: .normal)
        backbutton.tintColor = .white
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(.white, for: .normal)
        backbutton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    @objc func goBack() -> Void {
        dismiss(animated: true, completion: nil)
    }
}
