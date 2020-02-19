//
//  BuyButtonView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

protocol BuyButton: class {
    func touch()
}

class BuyButtonView: UIView {
    weak var delegate: BuyButton?
    
    var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BuyButtonView {
    private func setup() {
        self.backgroundColor = .lightBlue
        self.button = UIButton(frame:
            CGRect(x: 16,
                   y: 16,
                   width: self.frame.width - 32,
                   height: self.frame.height - 32))
        self.button.setTitle("Comprar", for: .normal)
        self.button.setTitleColor(.white, for: .normal)

        self.button.cornerRadius(radius: 8)
        self.button.backgroundColor = .buttonGreen
        self.button.addTarget(self, action: #selector(touch), for: .touchUpInside)
        
        self.addSubview(button)
    }
    
    @objc func touch(sender: UIButton!) {
        if let delegate = self.delegate {
            delegate.touch()
        }
    }
}
