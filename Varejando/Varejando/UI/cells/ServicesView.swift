//
//  ServicesView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class ServicesView: UIView {
    var icon: UIImageView!
    var lbName: UILabel!
    var lbInstallment: UILabel!
    var checkBox: RGCheckBox!
    
    var display: ServiceViewModel?
}

extension ServicesView {
    
    func setup() {
        self.inits()
        self.adds()
        self.sets()
    }
    
    private func inits() {
        self.backgroundColor = .lightGreen
        self.cornerRadius(radius: 10)
        
        self.icon = UIImageView(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        self.icon.setBorder(width: 1, color: .darkGray)
        self.icon.cornerRadius(radius: 2)
        self.icon.backgroundColor = .white
        
        self.checkBox = RGCheckBox(frame: CGRect(x: (self.frame.width - 16) - 25,
                                                 y: 16,
                                                 width: 25,
                                                 height: 25))
        self.checkBox.selectedColor = .title
        self.checkBox.unSelectedColor = .previousPrice
        self.checkBox.isCircle = true
        
        self.lbName = UILabel(frame:
            CGRect(x: (self.icon.frame.origin.x + self.icon.frame.width) + 16,
                   y: 5,
                   width: (self.checkBox.frame.origin.x) - (self.icon.frame.width + 35),
                   height: 50))
        self.lbName.numberOfLines = 2
        self.lbName.font = UIFont.boldSystemFont(ofSize: 14)
        self.lbName.textColor = .black
        
        self.lbInstallment = UILabel(frame:
            CGRect(x: (self.icon.frame.origin.x + self.icon.frame.width) + 16,
                   y: (self.lbName.frame.origin.y + self.lbName.frame.height),
                   width: (self.checkBox.frame.origin.x) - (self.icon.frame.width + 35),
                   height: 20))
        self.lbInstallment.textColor = .previousPrice
        self.lbInstallment.font = UIFont.boldSystemFont(ofSize: 10)
    }
    
    private func adds() {
        self.addSubview(icon)
        self.addSubview(lbName)
        self.addSubview(lbInstallment)
        self.addSubview(checkBox)
    }
    
    private func sets() {
        self.icon.image = UIImage(systemName: "tv.music.note")
        self.icon.tintColor = .darkGray
        
        self.lbName.text = display?.name
        self.lbInstallment.text = display?.installment
    }
}
