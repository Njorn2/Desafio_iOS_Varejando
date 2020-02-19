//
//  ViewController.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 08/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var presenter: ProductsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigation()
        
        self.setUpCollectionView()
        
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

extension ViewController {
    private func setUpCollectionView() {
        
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 20,
                                                             width: self.view.frame.width,
                                                             height: self.view.frame.height - 20),
                                               collectionViewLayout: UICollectionView.layoutDefault())
        
        self.collectionView.lineSpace(value: 1) // Espaço entre as linhas da CollectionView
        self.collectionView.automaticSize() // Automatic Cell Size
        
        self.collectionView.register(ProductsColletionViewCell.self,
                                     forCellWithReuseIdentifier: "ProductsColletionViewCell")
        self.collectionView.backgroundColor = UIColor.title
        self.collectionView.assignTo(delegate: self, dataSource: self)
        
        self.view.addSubview(self.collectionView)
    }
    
    private func setUpNavigation() {
        self.presenter?.navigationItem = self.navigationItem
        self.title = self.presenter?.title
        navigationController?.navigationBar.backgroundColor = UIColor.title
    }
}

extension ViewController: ProductsListPresenterOutput {
    func updateUIList() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.view.stopActivity()
        }
    }
    
    func updateUIListType() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func presentLoading() {
        self.view.presentActivity()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.didSelectCell(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter?.productsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductsColletionViewCell",
            for: indexPath) as? ProductsColletionViewCell {
            cell.display = self.presenter?.getProduct(at: indexPath.row)
            cell.setUp()
            return cell
        }
        return ProductsColletionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.presenter?.listBy == .LIST) ? self.view.frame.width : ((self.view.frame.width / 2) * 0.999)
        
        return CGSize(width: width, height: 410)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
