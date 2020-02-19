//
//  RGSliderCell.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class RGSliderCell: UICollectionViewCell {
    var image: UIImageView!
    var urlImage: String? {
        didSet {
            if self.image != nil, let url = self.urlImage, !url.isEmpty {
                self.image.presentActivity()
                self.image.download(url: url, done: { error in
                    if let error = error {
                        print("Dowload Image Error: " + error.localizedDescription)
                        self.image.image = UIImage(systemName: "cloud.bolt.fill")
                    }
                    self.image.stopActivity()
                    self.layoutIfNeeded()
                    self.reloadInputViews()
                })
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.inits()
        self.adds()
        self.image.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: String) {
        self.urlImage = image
    }
    
    private func inits() {
        self.subviews.forEach({view in
            view.removeFromSuperview()
        })
        self.image = UIImageView(frame:
            CGRect(x: 0,
                   y: 0,
                   width: self.frame.width,
                   height: self.frame.height))
        self.image.backgroundColor = .white
        self.urlImage = ""
    }
    
    private func adds() {
        self.addSubview(self.image)
    }
    
}
