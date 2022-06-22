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
        title.font = UIFont(name: Constants.Fonts.TrebuchetMSBold, size: 55)
        title.textColor = .systemIndigo
        return title
    }()
    
    let animationView: AnimationView = {
        let animation = AnimationView()
        animation.animation = Animation.named(Constants.animationName)
        animation.loopMode = .loop
        animation.contentMode = .scaleToFill
        animation.play(completion: .none)
        return animation
    }()
    
    let tabBarVC = UITabBarController()
    var service = WebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        
        configure()
        
        let url = NetworkConstants.Urls.fetchUpComingMoviesURL()
        service.performRequest(urlString: url)
    }
    
    func configure(){
        view.addSubview(titleLabel)
        view.addSubview(animationView)
        view.backgroundColor = .white
        
        configureConstraints()
    }
    
//MARK: - Tab bar
    func tabBarConfigure(){
        let movieListVC = MovieListViewController()
        let bookmarksVC = UIViewController()
        
        movieListVC.title = Constants.tabBarTitles.movieListScene
        bookmarksVC.title = Constants.tabBarTitles.bookmarksScene
        
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.backgroundColor = .black
        tabBarVC.tabBar.barTintColor = .white
        tabBarVC.setViewControllers([movieListVC,bookmarksVC], animated: false)

        guard let items = tabBarVC.tabBar.items else {return}
        
        for img in 0..<Constants.tabBarImages.count{
            items[img].image = UIImage(systemName: Constants.tabBarImages[img])
        }
        present(tabBarVC,animated: false)
    }
}
