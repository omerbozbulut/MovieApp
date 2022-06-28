//
//  Bookmarks+Constraints.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 23.06.2022.
//

import Foundation
import SnapKit

extension BookmarksViewController {
    
    func configureConstraints() {
        makeTableViewConstraints()
    }
    
    private func makeTableViewConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
