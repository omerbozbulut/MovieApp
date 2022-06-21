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
        title.font = UIFont(name: Constants.Fonts.helveticaBold, size: 55)
        title.textColor = .systemIndigo
        return title
    }()
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
        
    func configure(){
        view.addSubview(titleLabel)
        view.addSubview(animationView)
        view.backgroundColor = .white
        configureConstraints()
        animationViewDesign()
        animationView.play(completion: .none)
    }
    
    func animationViewDesign(){
        animationView.animation = Animation.named("movie")
        animationView.loopMode = .loop
        animationView.contentMode = .scaleToFill
    }
    
}

//MARK: - UIColor Extension

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
