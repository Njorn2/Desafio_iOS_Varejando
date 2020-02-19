//
//  PriceView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class PriceView: UIView {
    var lbPreviousPrice: UILabel!
    var lbCurrentPrice: UILabel!
    var lbInstallment: UILabel!
    var lbDiscoutFlag: UILabel!
    var border: UIView!
    
    var display: PriceViewModel!
    
    func setup() {
        self.inits()
        self.adds()
        self.sets()
    }
}

extension PriceView {
    private func inits() {
        self.lbPreviousPrice = UILabel(frame: CGRect(x: 16, y: 0, width: self.frame.width - 32, height: 25))
        self.lbPreviousPrice.textColor = UIColor.previousPrice
        self.lbPreviousPrice.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        self.lbCurrentPrice = UILabel(frame: CGRect(x: 14,
                                                    y:
            (self.lbPreviousPrice.frame.origin.y + self.lbPreviousPrice.frame.height) - 6.25,
                                                    width: 110,
                                                    height: 25))
        self.lbCurrentPrice.textColor = UIColor.currentPrice
        self.lbCurrentPrice.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        self.lbInstallment = UILabel(
            frame: CGRect(x: 16,
                          y: (self.lbCurrentPrice.frame.origin.y + self.lbCurrentPrice.frame.height),
                          width: self.frame.width - 32,
                          height: 25))
        self.lbInstallment.font = UIFont.boldSystemFont(ofSize: 10.0)
        self.lbInstallment.textColor = UIColor.previousPrice
        
        self.border = UIView(frame:
            CGRect(x: 0,
                   y: (self.lbInstallment.frame.origin.y + self.lbInstallment.frame.height) + 10,
                   width: self.frame.width,
                   height: 1))
        self.border.backgroundColor = UIColor.title
        
        self.lbDiscoutFlag = UILabel(frame:
            CGRect(x: self.lbCurrentPrice.frame.width + 10,
                   y: self.lbCurrentPrice.frame.origin.y + 3,
                   width: 50,
                   height: 18))
        
        self.lbDiscoutFlag.backgroundColor = .starYellow
        self.lbDiscoutFlag.cornerRadius(radius: 10)
        self.lbDiscoutFlag.textAlignment = .center
        self.lbDiscoutFlag.font = UIFont.boldSystemFont(ofSize: 11.0)
        self.lbDiscoutFlag.textColor = UIColor.black
        
    }
    
    private func adds() {
        self.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.addSubview(self.lbPreviousPrice)
        self.addSubview(self.lbCurrentPrice)
        self.addSubview(self.lbInstallment)
        self.addSubview(self.border)
        self.addSubview(self.lbDiscoutFlag)
    }
    
    private func sets() {
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
        
        self.lbCurrentPrice.text = display.currentPrice?.toBRL() ?? "R$ 0,00"
        self.lbInstallment.text = display.installment
        
        self.lbDiscoutFlag.text = display.percentDiscount?.toPercent() ?? ""
        self.lbDiscoutFlag.isHidden = self.lbDiscoutFlag.text?.isEmpty ?? false
    }
}
