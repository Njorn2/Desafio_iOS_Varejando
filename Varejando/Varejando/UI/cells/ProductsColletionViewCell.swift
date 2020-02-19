//
//  ProductsColletionViewCell.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class ProductsColletionViewCell: UICollectionViewCell {
    
    var cellWidthConstraint: NSLayoutConstraint!
    
    var image: UIImageView!
    var lbTitle: UILabel!
    var rating: RGStarRating!
    var lbPreviousPrice: UILabel!
    var lbCurrentPrice: UILabel!
    var lbInstallments: UILabel!
    
    var display: ProductsListItemViewModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUp() {
        self.inits()
        self.sets()
        self.addViews()
    }
    
    private func inits() {
        
        self.backgroundColor = UIColor.white
        
        self.image = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 200))
        
        self.lbTitle = UILabel(frame: CGRect(x: 16,
                                             y: (self.image.frame.origin.y + self.image.frame.height) + 5,
                                             width: self.frame.width - 32,
                                             height: 70))
        self.lbTitle.textColor = UIColor.title
        self.lbTitle.numberOfLines = 3
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        self.rating = RGStarRating(frame:
            CGRect(x: 16,
                   y: (self.lbTitle.frame.origin.y + self.lbTitle.frame.height),
                   width: self.frame.width - 32,
                   height: 20))
        
        self.lbPreviousPrice = UILabel(frame: CGRect(x: 16,
                                                     y: (self.rating.frame.origin.y + self.rating.frame.height) + 10,
                                                     width: self.frame.width,
                                                     height: 25))
        self.lbPreviousPrice.textColor = UIColor.previousPrice
        self.lbPreviousPrice.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        self.lbCurrentPrice = UILabel(frame: CGRect(x: 16,
                                                    y:
            (self.lbPreviousPrice.frame.origin.y + self.lbPreviousPrice.frame.height),
                                                    width: self.frame.width,
                                                    height: 25))
        self.lbCurrentPrice.textColor = UIColor.currentPrice
        self.lbCurrentPrice.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        self.lbInstallments = UILabel(
            frame: CGRect(x: 16,
                          y: (self.lbCurrentPrice.frame.origin.y + self.lbCurrentPrice.frame.height),
                          width: self.frame.width,
                          height: 25))
        self.lbInstallments.font = UIFont.boldSystemFont(ofSize: 12.0)
        self.lbInstallments.textColor = UIColor.buttonGreen
    }
    
    private func sets() {
        guard let display = self.display else { return }
        
        self.lbTitle.text = display.title ?? "Product Title"
        self.lbCurrentPrice.text = display.currentPrice?.toBRL() ?? "R$ 0,00"
        self.lbInstallments.text = display.installment
        
        // Rating
        self.rating.setRating(value: display.rating ?? 0)
        self.rating.setup()
        
        // ImageView
        self.image.download(url: display.image ?? "", done: { error in
            if error != nil {
                self.image.image = UIImage(named: "storm")
            }
        })
        image.contentMode = .center
        
        // Label Previous Price
        
        if display.previousPrice != display.currentPrice {
            let value = display.previousPrice?.toBRL() ?? "R$ 0,00"
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: value)
            let make = NSRange(location: 0, length: attributeString.length)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                         value: 2,
                                         range: make)
            self.lbPreviousPrice.attributedText = attributeString
        } else {
            self.lbPreviousPrice.text = ""
        }
    }
    
    private func addViews() {
        self.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.addSubview(self.image)
        self.addSubview(self.lbTitle)
        self.addSubview(self.rating)
        self.addSubview(self.lbPreviousPrice)
        self.addSubview(self.lbCurrentPrice)
        self.addSubview(self.lbInstallments)
    }
}
