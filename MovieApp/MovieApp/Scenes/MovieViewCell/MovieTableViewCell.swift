//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {

    let customView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .darkGray
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 4
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
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.font = UIFont(name: Constants.Fonts.TrebuchetMSBold, size: 20)
        return title
    }()
    
    let bookmark: UIButton = {
        let bookmark = UIButton()
        bookmark.setTitle("", for: .normal)
        bookmark.addTarget(self, action: #selector(addBookmark), for: .touchUpInside)
        bookmark.tintColor = .white
        bookmark.setBackgroundImage(UIImage(systemName: Constants.SymbolNames.bookmarkSymbolName), for: .normal)
        bookmark.imageView?.contentMode = .scaleAspectFill
        return bookmark
    }()
    
    let vote: UILabel = {
        let vote = UILabel()
        vote.textColor = .systemYellow
        vote.font = UIFont(name: Constants.Fonts.helvetica, size: 18)
        return vote
    }()
    
    private let viewModel = TableCellViewModel()
    var row = 0
    var isItRegistered = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        customView.addSubview(image)
        customView.addSubview(titleLabel)
        customView.addSubview(bookmark)
        customView.addSubview(vote)
        customView.addSubview(starImage)
        contentView.addSubview(customView)
        
        selectionStyle = .none
        backgroundColor = .black
        makeConstraints()
    }
    
    func configureMovie(movie: Movie) {
        image.kf.setImage(with: URL(string: NetworkConstants.Urls.fetchMovieImageURL(path:  movie.poster_path)))
        titleLabel.text = movie.title
        vote.text = "\(movie.vote_average)/10"
    }
    
    func configureBookmarks(movie: Movie) {
        image.kf.setImage(with: URL(string: NetworkConstants.Urls.fetchMovieImageURL(path: movie.poster_path)))
        titleLabel.text = movie.title
        vote.text = "\(movie.vote_average)/10"
    }
    
    @objc func addBookmark() {
        if !isItRegistered{
            isItRegistered = true
            viewModel.addBookmark(row)
        }
    }
}
