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
    
    var service = WebService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure(){
        let url = NetworkConstants.Urls.fetchUpComingMoviesURL()
        service.performRequest(urlString: url, completionHandler: { (success) -> Void in
            if !success{
                completeDownload()
            }else{
                print("Download Error")
            }
        })
        
        customView.addSubview(animationView)
        view.addSubview(titleLabel)
        view.addSubview(customView)
        
        view.backgroundColor = .black
        configureConstraints()
    }
    
    func completeDownload() {
        let delayInSeconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
           self.tabBarConfigure()
        }
    }
    
//MARK: - Tab bar
    func tabBarConfigure(){
        let tabBarVC = UITabBarController()
        
        let movieListVC = UINavigationController(rootViewController: MovieListViewController())
        let bookmarksVC = UINavigationController(rootViewController:  BookmarksViewController())
    
        movieListVC.title = Constants.tabBarTitles.movieListScene
        bookmarksVC.title = Constants.tabBarTitles.bookmarksScene
        
        tabBarVC.setViewControllers([movieListVC,bookmarksVC], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {return}
        
        for img in 0..<Constants.tabBarImages.count{
            items[img].image = UIImage(systemName: Constants.tabBarImages[img])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.tintColor = .white
        tabBarVC.tabBar.barTintColor = .white
        present(tabBarVC, animated: false)
    }
}
