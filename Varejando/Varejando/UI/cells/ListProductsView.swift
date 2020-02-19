//
//  ListProductsView.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class ListProductView: UIView {
    var leftLine: UIView!
    var rightLine: UIView!
    var lbTitle: UILabel!
    var collectionView: UICollectionView!
     
    var display: [ProductsListItemViewModel]? {
        didSet {
            self.collectionView.reloadData()
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

extension ListProductView {
    func setTitle(_ title: String) {
        self.lbTitle.text = title
    }
    private func setup() {
        self.inits()
        self.setupCollectionView()
        self.adds()
    }
    
    private func inits() {
        self.leftLine = UIView(frame:
            CGRect(x: 16,
                   y: 36,
                   width: 50,
                   height: 1))
        self.leftLine.backgroundColor = .lightGray
        self.rightLine = UIView(frame:
            CGRect(x: self.frame.width - 66,
                   y: 36,
                   width: 50,
                   height: 1))
        self.rightLine.backgroundColor = .lightGray
        
        self.lbTitle = UILabel(frame: CGRect(x: 66,
                                             y: 16,
                                             width: self.frame.width - 132,
                                             height: 40))
        self.lbTitle.textAlignment = .center
        self.lbTitle.backgroundColor = .clear
        self.lbTitle.textColor = .title
        self.lbTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private func setupCollectionView() {
        self.collectionView = UICollectionView(frame:
            CGRect(x: 0,
                   y: (self.lbTitle.frame.origin.y + self.lbTitle.frame.height) + 32,
                   width: self.frame.width,
                   height: self.frame.height - ((self.lbTitle.frame.origin.y + self.lbTitle.frame.height) + 16)),
                                               collectionViewLayout: UICollectionView.layoutDefault(
                                                direction: .horizontal))
        self.collectionView.automaticSize()
        
        self.collectionView.assignTo(delegate: self, dataSource: self)
        
        self.collectionView.register(ProductsColletionViewCell.self,
        forCellWithReuseIdentifier: "ProductsColletionViewCell")
        
        self.collectionView.isPagingEnabled = false
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.backgroundColor = .white
    }
    
    private func adds() {
        self.addSubview(self.leftLine)
        self.addSubview(self.rightLine)
        self.addSubview(self.lbTitle)
        self.addSubview(self.collectionView)
    }
}

extension ListProductView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.display?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductsColletionViewCell",
            for: indexPath) as? ProductsColletionViewCell, let product = self.display?[indexPath.row] {
            cell.display = product
            cell.setUp()
            return cell
        }
        return ProductsColletionViewCell()
    }
}

extension ListProductView: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: ((self.frame.width / 2) * 0.999), height: self.collectionView.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
