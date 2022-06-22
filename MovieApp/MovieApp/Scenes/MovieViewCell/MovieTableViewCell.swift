//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    let customView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "doc.fill")
        return image
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        return title
    }()
    
    let bookmark: UIButton = {
        let bookmark = UIButton()
        bookmark.setTitle("", for: .normal)
        bookmark.setImage(UIImage(systemName: "bookmarks"), for: .normal)
        bookmark.addTarget(self, action: #selector(addBookmark), for: .touchUpInside)
        bookmark.tintColor = .white
        return bookmark
    }()
    
    let vote: UILabel = {
        let vote = UILabel()
        vote.textColor = .systemYellow
        return vote
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        customView.addSubview(image)
        customView.addSubview(title)
        customView.addSubview(bookmark)
        contentView.addSubview(customView)
        
        selectionStyle = .none
        backgroundColor = .black
        
        makeConstraints()
    }
    
    func configureMovie(movie: Movie){
        title.text = movie.title
        vote.text = "\(movie.vote_average)/10"
    }
    
    @objc func addBookmark(){
        print("bookmark eklendi")
    }
}
