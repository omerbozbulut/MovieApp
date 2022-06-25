//
//  MovieDetail+Constraints.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 23.06.2022.
//

import Foundation
import SnapKit

extension MovieDetailViewController {
    
    func configureConstraints(){
        makeImageConstraints()
        makeStarImageConstraints()
        makeTitleLabelConstraints()
        makeOverviewConstraints()
        makeVoteConstraints()
        makeReleaseDateConstraints()
    }
    
    private func makeImageConstraints(){
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(216)
            make.width.equalTo(140)
        }
    }
    
    private func makeTitleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
    
    private func makeStarImageConstraints(){
        starImage.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.equalTo(image.snp.trailing).offset(24)
        }
    }
    
    private func makeVoteConstraints(){
        vote.snp.makeConstraints { make in
            make.leading.equalTo(starImage.snp.trailing).offset(8)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
    }
    
    private func makeReleaseDateConstraints(){
        releaseDate.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(24)
            make.top.equalTo(starImage.snp.bottom).offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    private func makeOverviewConstraints(){
        overview.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}
