//
//  ViewController.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 19.06.2022.
//

import UIKit
import Lottie
import CLTypingLabel

class SplashScreenViewController: UIViewController {

    let titleLabel: CLTypingLabel = {
        let title = CLTypingLabel()
        title.text = Constants.Titles.splashScreenLabel
        title.font = UIFont(name: Constants.Fonts.helveticaBOLD, size: 57)
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.5
        title.textColor = .systemIndigo
        title.contentMode = .center
        return title
    }()
    
    let customView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 100
        view.backgroundColor = .white
        return view
    }()
    
    let animationView: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named(Constants.animationName)
        animation.loopMode = .loop
        animation.contentMode = .scaleAspectFill
        animation.play(completion: .none)
        return animation
    }()
    
    var genreService = GenreService()
    var movieService = MovieService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    func configure() {
        
        configureData()
        
        customView.addSubview(animationView)
        view.addSubview(titleLabel)
        view.addSubview(customView)
        
        view.backgroundColor = .black
        configureConstraints()
    }
    
    func configureData() {
        
        let movieUrl = NetworkConstants.Urls.fetchUpComingMoviesURL()
        movieService.fetchMovie(urlString: movieUrl) { result in
            switch result {
            case .success(let movieList):
                movies = movieList
                self.completeDownload()
            case .failure(let error):
                self.errorAlert(errorMessage: error.localizedDescription)
            }
        }
        
        let genreUrl = NetworkConstants.Urls.fetchGenreListURL()
        genreService.fetchGenre(urlString: genreUrl) { result in
            switch result {
            case .success(let genreList):
                genres = genreList
                self.completeDownload()
            case .failure(let error):
                self.errorAlert(errorMessage: error.localizedDescription)
            }
        }
    }
    
    func errorAlert(errorMessage: String){
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .actionSheet)
        let error = UIAlertAction(title: "Error", style: .default, handler: nil)
        alert.addAction(error)
    }
    
    func completeDownload() {
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
           self.tabBarConfigure()
        }
    }
}
