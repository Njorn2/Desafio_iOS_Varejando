//
//  DetailView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class DetailView: UIView {
    var lbTitle: UILabel!
    var lbDescription: UILabel!
    var border: UIView!
    
    var display: String! {
        didSet {
            self.setup()
            self.lbDescription.text = self.display
            self.lbDescription.sizeToFit()
            self.border.frame.origin.y = (self.lbDescription.frame.origin.y + self.lbDescription.frame.height) + 16
            self.layoutIfNeeded()
            self.setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView {
    private func setup() {
        self.inits()
        self.adds()
    }
    
    private func inits() {
        self.lbTitle = UILabel(frame:
            CGRect(x: 16,
                   y: 16,
                   width: self.frame.width - 32,
                   height: 40))
        self.lbTitle.textColor = .title
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        self.lbTitle.text = "Descrição".uppercased()
        
        self.lbDescription = UILabel()
        self.lbDescription.frame.origin.x = 16
        self.lbDescription.frame.origin.y = (self.lbTitle.frame.origin.y + self.lbTitle.frame.height) + 16
        self.lbDescription.frame.size.width = self.frame.width - 32
        self.lbDescription.numberOfLines = 0
        self.lbDescription.textColor = .darkGray
        self.lbDescription.font = UIFont.boldSystemFont(ofSize: 15)
        
        self.border = UIView(frame:
            CGRect(x: 0,
                   y: (self.lbDescription.frame.origin.y + self.lbDescription.frame.height) + 16,
                   width: self.frame.width,
                   height: 1))
        self.border.backgroundColor = .title
    }
    
    private func adds() {
        self.subviews.forEach({view in
            view.removeFromSuperview()
        })
        self.addSubview(lbTitle)
        self.addSubview(lbDescription)
        self.addSubview(border)
    }
}
