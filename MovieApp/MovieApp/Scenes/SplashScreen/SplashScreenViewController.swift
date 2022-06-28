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
        title.font = UIFont(name: Constants.Fonts.helveticaBOLD, size: 55)
        title.textColor = .systemIndigo
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
    
    var movieService = MovieService()
    var genreService = GenreService()
    
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
        movieService.performMovieRequest(urlString: movieUrl) { results, errorMessage  in
            if let results = results {
              movies = results
            }
        }
        
        let genreURl = NetworkConstants.Urls.fetchGenreListURL()
        genreService.performGenreRequest(urlString: genreURl) { results, errorMessage  in
            if let results = results {
              genres = results
            }
        }
    
        completeDownload()
    }
    
    func completeDownload() {
        let delayInSeconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
           self.tabBarConfigure()
        }
    }
}
