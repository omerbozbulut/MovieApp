//
//  TableCell+Constraints.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation

extension MovieTableViewCell{
    func makeConstraints(){
        makeCustomViewConstraints()
        makeImageConstraints()
        makeStarImageConstraints()
        makeTitleConstraints()
        makeBookmarkConstraints()
        makeVoteConstraints()
    }
    
    private func makeCustomViewConstraints(){
        customView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func makeImageConstraints(){
        image.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.bottom.equalTo(-8)
            make.width.equalTo(64)
        }
    }
    
    private func makeStarImageConstraints(){
        starImage.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func makeTitleConstraints(){
        title.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    private func makeBookmarkConstraints(){
        bookmark.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(24)
            make.height.equalTo(32)
        }
    }
    
    private func makeVoteConstraints(){
        vote.snp.makeConstraints { make in
            make.leading.equalTo(starImage.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
}

