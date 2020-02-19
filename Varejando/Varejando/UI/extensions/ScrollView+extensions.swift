//
//  ScrollView+extensions.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

extension UIScrollView {
    func updateContent() {
        var height: CGFloat = 0.0
        self.subviews.forEach({view in
            height += view.frame.height
        })
        height += 40
        self.contentSize = CGSize(width: self.frame.width, height: height)
    }
}
