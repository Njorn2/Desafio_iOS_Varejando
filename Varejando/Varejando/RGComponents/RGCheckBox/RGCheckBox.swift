//
//  CheckBox.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class RGCheckBox: UIView {
    var isChecked: Bool = false
    
    var markedView: UIView!
    
    var isCircle: Bool! = false {
        didSet {
            if self.isCircle {
                self.circle()
                self.markedView.circle()
            } else {
                self.clipsToBounds = false
                self.markedView.clipsToBounds = false
            }
        }
    }
    
    var selectedColor: UIColor! {
        didSet {
            self.markedView.backgroundColor = self.selectedColor
            if isChecked {
                self.setBorder(width: 1, color: self.selectedColor)
            }
        }
    }
    var unSelectedColor: UIColor! {
        didSet {
            if !isChecked {
                self.setBorder(width: 1, color: self.unSelectedColor)
            }
        }
    }
    var boxBackgroundColor: UIColor! {
        didSet {
            self.backgroundColor = self.boxBackgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup(size: frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RGCheckBox {
    
    func setSize(size: CGFloat) {
        self.setup(size: size)
    }
    
    private func setup(size: CGFloat) {
        self.frame.size.height = size
        self.frame.size.width = self.frame.height
        self.boxBackgroundColor = .white
        self.markedView = UIView(frame: CGRect(x: size / 4, y: size / 4, width: size / 2, height: size / 2))
        
        self.selectedColor = .systemGreen
        self.unSelectedColor = .lightGray
         
        let gestureSwift2AndHigher = UITapGestureRecognizer(target: self,
                                                            action:
            #selector(self.setSelect(_:)
            ))
        self.addGestureRecognizer(gestureSwift2AndHigher)
        
//        self.setSelect(self)
    }
    
    @objc func setSelect(_ view: UIView) {
        self.isChecked = !self.isChecked
        
        self.subviews.forEach({ view in
            view.removeFromSuperview()
        })
        self.setBorder(width: 1, color: self.unSelectedColor)
        if self.isChecked {
            self.addSubview(self.markedView)
            self.setBorder(width: 1, color: self.selectedColor)
        }
    }
}
