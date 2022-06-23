//
//  MovieList+Constraints.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation
import SnapKit

extension MovieListViewController {
    
    func configureConstraints(){
        makeFilterButtonConstraints()
        makeTableViewConstraints()
    }
    
    func makeFilterButtonConstraints(){
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(32)
        }
    }
    
    func makeTableViewConstraints(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(filterButton.snp.bottom).offset(16)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
