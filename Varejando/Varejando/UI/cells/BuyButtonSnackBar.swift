//
//  BuyButtonSnackBar.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class BuyButtonSnackBar: UIView {
    weak var delegate: BuyButton?
    
    var button: UIButton!
    var lbCurrentPrice: UILabel!
    var lbInstallment: UILabel!
    var lbDiscoutFlag: UILabel!
    
    var display: PriceViewModel! {
        didSet {
            self.sets()
            self.adds()
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

extension BuyButtonSnackBar {
    
    private func setup() {
        self.backgroundColor = .lightBlue
        self.button = UIButton(frame:
            CGRect(x: self.frame.width - ((self.frame.width / 3) + 16),
                   y: 16,
                   width: self.frame.width / 3,
                   height: self.frame.height - 32))
        self.button.setTitle("Comprar", for: .normal)
        self.button.setTitleColor(.white, for: .normal)

        self.button.cornerRadius(radius: 8)
        self.button.backgroundColor = .buttonGreen
        self.button.addTarget(self, action: #selector(touch), for: .touchUpInside)
        
        self.lbCurrentPrice = UILabel(frame: CGRect(x: 14,
                                                    y: 16,
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
        self.addSubview(button)
        self.addSubview(lbCurrentPrice)
        self.addSubview(lbInstallment)
        self.addSubview(lbDiscoutFlag)
    }
    
    private func sets() {
        self.lbCurrentPrice.text = display.currentPrice?.toBRL() ?? "R$ 0,00"
        self.lbInstallment.text = display.installment
        
        self.lbDiscoutFlag.text = display.percentDiscount?.toPercent() ?? ""
        self.lbDiscoutFlag.isHidden = self.lbDiscoutFlag.text?.isEmpty ?? false
    }
    
    @objc func touch(sender: UIButton!) {
        if let delegate = self.delegate {
            delegate.touch()
        }
    }
}
