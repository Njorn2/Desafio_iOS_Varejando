//
//  ProductTableViewCell.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class ProductView: UIView {
    var slider: RGSlider!
    var lbTitle: UILabel!
    var lbSku: UILabel!
    var border: UIView!
    
    var display: ProductDetailsViewModel?
    
    func setup() {
        self.backgroundColor = .white
        self.inits()
        self.adds()
        self.sets()
    }
}

extension ProductView {
    private func inits() {
        self.slider = RGSlider(frame: CGRect(x: 0, y: 0,
                                             width: self.frame.width,
                                             height: 320
        ))
        
        self.lbTitle = UILabel(frame:
            CGRect(x: 16,
                   y: (self.slider.frame.origin.y + self.slider.frame.height) + 15,
                   width: self.frame.width - 32,
                   height: 70))
        self.lbTitle.numberOfLines = 3
        self.lbTitle.textColor = UIColor.darkGray
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        self.lbSku = UILabel(frame: CGRect(x: 16,
                                           y: (self.lbTitle.frame.origin.y + self.lbTitle.frame.height) + 15,
                                           width: self.frame.width - 32,
                                           height: 20))
        self.lbSku.textColor = UIColor.lightGray
        self.lbSku.font = UIFont.boldSystemFont(ofSize: 14.0)
        
        self.border = UIView(frame:
            CGRect(x: 0,
                   y: (self.lbSku.frame.origin.y + self.lbSku.frame.height) + 15,
                   width: self.frame.width,
                   height: 1))
        self.border.backgroundColor = UIColor.title
    }
    
    private func adds() {
        self.subviews.forEach({view in
            view.removeFromSuperview()
        })
        
        self.addSubview(slider)
        self.addSubview(lbTitle)
        self.addSubview(lbSku)
        self.addSubview(border)
    }
    
    private func sets() {
        self.slider.images = display?.images
        slider.setup()
        self.lbTitle.text = display?.title
        self.lbSku.text = "Cód. Item " + (String(describing: display?.sku ?? 0))
        
        self.layoutIfNeeded()
    }
}
