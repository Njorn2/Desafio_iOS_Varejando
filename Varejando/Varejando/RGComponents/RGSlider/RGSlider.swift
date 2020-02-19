//
//  RGSlider.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class RGSlider: UIView {
    var collectionView: UICollectionView!
    var pageControl: UIPageControl!
    
    var images: [String]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        self.setupCollectionView()
        self.setupPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        if self.collectionView == nil {
            self.setupCollectionView()
            self.setupPageControl()
        }
        self.collectionView.reloadData()
        self.pageControl.numberOfPages = self.images?.count ?? 0
        self.pageControl.currentPage = 0
        self.layoutIfNeeded()
    }
}

extension RGSlider {
    private func indexOfMajorCell() -> Int {
        
        guard let collectionViewLayout = self.collectionView.collectionViewLayout as?
            UICollectionViewFlowLayout else {
            return 0
        }
        
        let itemWidth = collectionViewLayout.itemSize.width
        let proportionalOffset = collectionViewLayout.collectionView!.contentOffset.x / itemWidth
        let index = Int(round(proportionalOffset))
        let safeIndex = max(0, min((images?.count ?? 1) - 1, index))
        return safeIndex
    }
    
    private func setupPageControl() {
//        var y = self.frame.height - 40
//        y = ((y * 0.9) - (y * 0.12))
        self.pageControl = UIPageControl(frame:
            CGRect(x: 0,
                   y: (self.collectionView.frame.origin.y + self.collectionView.frame.height),
                   width: self.frame.width,
                   height: 20))
        self.pageControl.currentPageIndicatorTintColor = .title
        self.pageControl.tintColor = .lightGray
        self.pageControl.pageIndicatorTintColor = .lightGray
        
        self.addSubview(self.pageControl)
    }
    
    private func setupCollectionView() {
        var height = self.frame.height - 20
        height = ((height * 0.9) - (height * 0.12))
        self.collectionView = UICollectionView(frame: CGRect(x: 0,
                                                             y: 0,
                                                             width: self.frame.width,
                                                             height: height),
                                               collectionViewLayout: UICollectionView.layoutDefault(
                                                direction: .horizontal))
        self.collectionView.automaticSize() // Automatic Cell Size
        
        self.collectionView.assignTo(delegate: self, dataSource: self)
        
        self.collectionView.register(RGSliderCell.self,
        forCellWithReuseIdentifier: "RGSliderCell")
        
        self.collectionView.isPagingEnabled = true
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.backgroundColor = .white
        
        self.addSubview(self.collectionView)
        
        self.frame.size.height = height
        self.layoutIfNeeded()
    }
}

extension RGSlider: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "RGSliderCell",
            for: indexPath) as? RGSliderCell {
            cell.urlImage = self.images?[indexPath.row] ?? ""
            return cell
        }
        return RGSliderCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scrollView.contentOffset.x / self.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

extension RGSlider: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.width, height: self.collectionView.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
}
