//
//  RGRating.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class RGRating: UIView {
    var lbNote: UILabel!
    var bar: UIView!
    var lbMaxNote: UILabel!
    var ratingStar: RGStarRating!
    var lbRatingCount: UILabel!
    var opinionsView: [OpinionView]?
    
    var display: RatingViewModel! {
        didSet {
            self.updateUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.adds()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RGRating {
    func updateUI() {
        self.lbNote.text = String(describing: display.rating ?? 0)
        
        var ratingCount = ""
        
        if let count = display.count {
            if count == 0 {
                ratingCount = "Nunhuma Avaliação"
            }
            if count == 1 {
                ratingCount = String(describing: count) + " Avaliação"
            }
            if count > 1 {
                ratingCount = String(describing: count) + " Avaliações"
            }
        }
        self.lbRatingCount.text = ratingCount
        self.ratingStar.setRating(value: display.rating ?? 0)
        self.ratingStar.setup()
        
        self.opinionsView = []
        var y = (lbMaxNote.frame.origin.y + lbMaxNote.frame.height) + 16
        if let opinions = display.opinions {
            opinions.forEach({ opinion in
                let opinionView = OpinionView(frame:
                    CGRect(x: 0,
                           y: y,
                           width: self.frame.width,
                           height: 100))
                opinionView.display = opinion
                self.opinionsView?.append(opinionView)
                y = opinionView.frame.origin.y + opinionView.frame.height
            })
            
            self.opinionsView?.forEach({ opinionView in
                self.addSubview(opinionView)
            })
            self.layoutIfNeeded()
        }
    }
    
    private func setup() {
        self.lbNote = UILabel(frame:
            CGRect(x: 16, y: 16, width: 40, height: 30))
        self.lbNote.textColor = .black
        self.lbNote.font = UIFont.boldSystemFont(ofSize: 25)
        self.lbNote.textAlignment = .center
        
        self.bar = UIView(frame:
            CGRect(x: 16, y: (self.lbNote.frame.origin.y + self.lbNote.frame.height), width: 40, height: 2))
        self.bar.backgroundColor = .previousPrice
        
        self.lbMaxNote = UILabel(frame:
            CGRect(x: 16,
                   y: (self.bar.frame.origin.y + self.bar.frame.height),
                   width: 40,
                   height: 20))
        self.lbMaxNote.textColor = .previousPrice
        self.lbMaxNote.font = UIFont.boldSystemFont(ofSize: 16)
        self.lbMaxNote.text = "de 5"
        self.lbMaxNote.textAlignment = .center
        
        self.ratingStar = RGStarRating(frame:
            CGRect(x: (self.lbNote.frame.origin.x + self.lbNote.frame.width) + 5,
                   y: 16,
                   width: (self.lbNote.frame.origin.x + self.lbNote.frame.width) - (self.frame.width - 16),
                   height: 25))
        
        self.lbRatingCount = UILabel(frame:
            CGRect(x: (self.lbNote.frame.origin.x + self.lbNote.frame.width) - 16,
                   y: self.lbMaxNote.frame.origin.y,
                   width: self.frame.width - (self.lbNote.frame.origin.x + self.lbNote.frame.width),
                   height: 20))
        self.lbRatingCount.textColor = .darkGray
        self.lbRatingCount.font = UIFont.boldSystemFont(ofSize: 16)
        self.lbRatingCount.textAlignment = .right
    }
    
    private func adds() {
        self.addSubview(self.lbNote)
        self.addSubview(self.bar)
        self.addSubview(self.lbMaxNote)
        self.addSubview(self.ratingStar)
        self.addSubview(self.lbRatingCount)
    }
}
