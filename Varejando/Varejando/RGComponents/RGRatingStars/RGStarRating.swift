//
//  RGStarRating.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class RGStarRating: UIView {
    
    private var mRating: Double = 0
    var starColor: UIColor = UIColor.starYellow
    var size: CGSize = CGSize(width: 25, height: 25)
    
    var stars: [UIImage]!
    
    init(frame: CGRect, rating: Double, color: UIColor, size: CGSize) {
        super.init(frame: frame)
        self.mRating = rating
        self.starColor = color
        self.size = size
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mRating = 0
        self.starColor = UIColor.starYellow
        self.size = CGSize(width: 25, height: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RGStarRating {
    func setRating(value: Double) {
        self.mRating = value
    }
}

extension RGStarRating: RGStars {
    
    var rating: Double? {
        return self.mRating
    }
    
    var color: UIColor? {
        return self.starColor
    }
    
    var starSize: CGSize? {
        return self.size
    }
    
    func setup() {
        self.setupStars()
        self.addStars()
    }
    
    internal func setupStars() {
        stars = []
        let mRating = self.rating ?? 0
        var max: Double = mRating
        for index in 1...5 {
            var starName = "star"
            
            if Double(index) <= mRating {
                starName = "star.fill"
            }
            
            if max > Double(0) && max < Double(1) {
                starName = "star.lefthalf.fill"
            }
            
            if let image = UIImage(systemName: starName, compatibleWith: .current) {
                image.withTintColor(self.color ?? UIColor.yellow, renderingMode: .alwaysTemplate)
                stars.append(image)
            }
            
            max -= 1
        }
    }
    
    internal func addStars() {
        self.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        var x: CGFloat = 0
        self.stars.forEach({star in
            let image = UIImageView(image: star)
            image.frame.size = self.starSize ?? CGSize(width: 25, height: 25)
            image.frame.origin.x = x
            image.tintColor = self.color
            self.addSubview(image)
            x = (image.frame.origin.x + 3) + image.frame.width
        })
    }
}
