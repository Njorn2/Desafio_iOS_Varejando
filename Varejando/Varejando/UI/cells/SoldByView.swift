//
//  SoldByView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class SoldByView: UIView {
    var lbTitle: UILabel!
    var lbShopkeeper: UILabel!
    var lbAlsoSold: UILabel!
    var lbAnotherShopkeeper: UILabel!
    var shopButton: UIButton!
    var border: UIView!
    
    var display: ShopkeeperViewModel! {
        didSet {
            self.sets()
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

extension SoldByView {
    private func setup() {
        self.inits()
        self.adds()
    }
    
    private func inits() {
        self.lbTitle = UILabel(frame:
            CGRect(x: 16,
                   y: 16,
                   width: self.frame.width - 32,
                   height: 20))
        self.lbTitle.textColor = .title
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 18)
        self.lbTitle.text = "Vendido e entregue por".uppercased()
        
        self.lbShopkeeper = UILabel(frame:
            CGRect(x: 16,
                   y: (self.lbTitle.frame.origin.y + self.lbTitle.frame.height) + 16,
                   width: self.frame.width - 32,
                   height: 40))
        self.lbShopkeeper.textColor = .title
        self.lbShopkeeper.font = UIFont.boldSystemFont(ofSize: 15)
        self.lbShopkeeper.setBorder(width: 1, color: .title)
        self.lbShopkeeper.cornerRadius(radius: 5)
        self.lbShopkeeper.textAlignment = .center
        
        self.lbAlsoSold = UILabel(frame:
            CGRect(x: 16,
                   y: (self.lbShopkeeper.frame.origin.y + self.lbShopkeeper.frame.height) + 20,
                   width: self.frame.width - 32,
                   height: 20))
        self.lbAlsoSold.textColor = .previousPrice
        self.lbAlsoSold.font = UIFont.boldSystemFont(ofSize: 14)
        
        self.lbAnotherShopkeeper = UILabel(frame:
            CGRect(x: 16,
                   y: (self.lbAlsoSold.frame.origin.y + self.lbAlsoSold.frame.height) + 2,
                   width: self.frame.width - 89,
                   height: 40))
        self.lbAnotherShopkeeper.textColor = .previousPrice
        self.lbAnotherShopkeeper.font = UIFont.boldSystemFont(ofSize: 15)
        self.lbAnotherShopkeeper.setBorder(width: 1, color: .previousPrice)
        self.lbAnotherShopkeeper.cornerRadius(radius: 5)
        
        self.shopButton = UIButton(frame:
            CGRect(x: self.frame.width - 56,
                   y: self.lbAnotherShopkeeper.frame.origin.y,
                   width: 40,
                   height: 40))
        self.shopButton.backgroundColor = .buttonGreen
        self.shopButton.cornerRadius(radius: 5)
        self.shopButton.setImage(UIImage(systemName: "cart"), for: .normal)
        self.shopButton.tintColor = .white
        
        self.border = UIView(frame:
            CGRect(x: 0,
                   y: (self.shopButton.frame.origin.y + self.shopButton.frame.height) + 16,
                   width: self.frame.width,
                   height: 1))
        self.border.backgroundColor = .title
    }
    
    private func adds() {
        self.addSubview(self.lbTitle)
        self.addSubview(self.lbShopkeeper)
        self.addSubview(self.lbAlsoSold)
        self.addSubview(self.lbAnotherShopkeeper)
        self.addSubview(self.shopButton)
        self.addSubview(self.border)
    }
    
    private func sets() {
        self.lbShopkeeper.text = (display.name ?? "") + " - " + (display.price?.toBRL() ?? "R$ 0,00")
        
        if let firstAnotherShopkeeper = display.featuredShopkeepers?.first {
            self.lbAnotherShopkeeper.text = " " + (firstAnotherShopkeeper.name ?? "") +
                " - " + (firstAnotherShopkeeper.price?.toBRL() ?? "R$ 0,00")
        }
    }
}
