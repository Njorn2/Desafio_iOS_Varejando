//
//  UICollectionView+Extensions.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func assignTo(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func lineSpace(value: CGFloat?) {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout, let space = value {
            flowLayout.minimumLineSpacing = space
        }
    }
    
    func automaticSize() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    class func layoutDefault() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        return layout
    }
    
    class func layoutDefault(direction: ScrollDirection) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = direction
        return layout
    }
}
