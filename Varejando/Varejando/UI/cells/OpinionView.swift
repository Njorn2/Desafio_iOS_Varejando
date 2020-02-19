//
//  OpinionView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class OpinionView: UIView {
    var lbTitle: UILabel!
    var lbComment: UILabel!
    var stars: RGStarRating!
    var border: UIView!
    
    var display: OpinionViewModel! {
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

extension OpinionView {
    func updateUI() {
        self.lbTitle.text = (display.date?.toDate(
            dateFormat: "dd/MM/yyyy").toString() ?? "") + " - " + (display.client ?? "")
        self.lbComment.text = display.comment
        self.stars.setRating(value: display.note)
        self.stars.setup()
    }
    private func setup() {
        self.lbTitle = UILabel(frame:
            CGRect(x: 16,
                   y: 16,
                   width: self.frame.width - 98,
                   height: 20))
        self.lbTitle.textColor = .darkGray
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 14)
        
        self.lbComment = UILabel(frame:
            CGRect(x: 16,
                   y: (self.lbTitle.frame.origin.y + self.lbTitle.frame.height),
                   width: self.frame.width - 32,
                   height: self.frame.height - (self.lbTitle.frame.origin.y + self.lbTitle.frame.height)))
        self.lbComment.textColor = .gray
        
        self.stars = RGStarRating(frame:
            CGRect(x: self.frame.width - 106,
                   y: 16,
                   width: 70,
                   height: 20))
        self.stars.size = CGSize(width: 15, height: 15)
        
        self.border = UIView(frame:
            CGRect(x: 16,
                   y: self.frame.height - 1,
                   width: self.frame.width - 32,
                   height: 1))
        self.border.backgroundColor = .lightGray
    }
    
    private func adds() {
        self.addSubview(self.lbTitle)
        self.addSubview(self.lbComment)
        self.addSubview(self.stars)
        self.addSubview(self.border)
    }
}
