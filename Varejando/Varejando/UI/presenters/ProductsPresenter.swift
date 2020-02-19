//
//  ProductsPresenter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class ProductsPresenter: ProductsListPresenterInput {
    
    weak var output: ProductsListPresenterOutput?
    var interactor: ProductsListInteractorInput
    var router: ProductsRouter
    
    var navigationItem: UINavigationItem? {
        didSet {
            let listButton = UIBarButtonItem.init(image: UIImage(systemName: "list.bullet"),
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(self.listType))
            let tableButton = UIBarButtonItem.init(image: UIImage(systemName: "square.grid.2x2.fill"),
                                                   style: .done,
                                                   target: self,
                                                   action: #selector(self.tableType))
            
            self.navigationItem?.rightBarButtonItems = [tableButton, listButton]
            self.navigationItem?.rightBarButtonItems?.first?.tintColor =
                (self.listBy == .LIST) ?
                    UIColor.lightGray : UIColor.title
            self.navigationItem?.rightBarButtonItems?.last?.tintColor =
                (self.listBy == .LIST) ? UIColor.title : UIColor.lightGray
        }
    }
    
    var productsCount: Int {
        return viewModel.count
    }
    
    var listBy: ListBy = .TABLE
    
    var title: String {
        return "Smart TV"
    }
    
   var viewModel: [ProductsListItemViewModel] = [] {
        didSet {
            output?.updateUIList()
        }
    }
    
    init(interactor: ProductsListInteractorInput, router: ProductsRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func listBy(type: ListBy) {
        self.listBy = type
        output?.updateUIListType()
    }
    
    func viewDidLoad() {
        output?.presentLoading()
        DispatchQueue(label: "Fetch Products").async {
            self.interactor.fetch()
        }
    }
    
    func viewWillAppear() {
        
    }
    
    func didSelectCell(at index: Int) {
        router.presentDetails()
    }
    
    func getProduct(at index: Int) -> ProductsListItemViewModel {
        return viewModel[index]
    }
}

extension ProductsPresenter {
    @objc func listType() {
        self.listBy(type: .LIST)
        self.navigationItem?.rightBarButtonItems?.first?.tintColor = UIColor.lightGray
        self.navigationItem?.rightBarButtonItems?.last?.tintColor = UIColor.title
    }
    
    @objc func tableType() {
        self.listBy(type: .TABLE)
        self.navigationItem?.rightBarButtonItems?.first?.tintColor = UIColor.title
        self.navigationItem?.rightBarButtonItems?.last?.tintColor = UIColor.lightGray
    }
}

extension ProductsPresenter: ProductsListInteractorOutput {
    func fetched(products: ProductsEntity) {
        self.viewModel = RGMapper.parse(from: products)
    }
}
