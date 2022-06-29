//
//  SplashScreen+TabBar.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 28.06.2022.
//

import UIKit

//MARK: - Tab bar
extension SplashScreenViewController{
    func tabBarConfigure(){
        let tabBarVC = UITabBarController()
        
        let movieListVC = UINavigationController(rootViewController: MovieListViewController())
        let bookmarksVC = UINavigationController(rootViewController:  BookmarksViewController())

        movieListVC.title = Constants.TabBarTitles.movieListScene
        bookmarksVC.title = Constants.TabBarTitles.bookmarksScene
        
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

