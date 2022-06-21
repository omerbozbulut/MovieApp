//
//  SplashScreen+Constraints.swift
//  MovieApp
//
//  Created by omer faruk bozbulut on 21.06.2022.
//

import Foundation
import SnapKit

extension SplashScreenViewController {
    func configureConstraints(){
        makeTitleConstraints()
        makeAnimationConstraints()
    }
    
    private func makeTitleConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.center.x)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
        }
    }
    
    private func makeAnimationConstraints(){
        animationView.snp.makeConstraints { make in
            make.centerX.equalTo(view.center.x)
            make.centerY.equalTo(view.center.y)
            make.height.width.equalTo(360)
        }
    }
}
