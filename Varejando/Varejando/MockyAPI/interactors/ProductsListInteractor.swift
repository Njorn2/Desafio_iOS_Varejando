//
//  File.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductsListInteractor: ProductsListInteractorInput {
    weak var output: ProductsListInteractorOutput?
    var manager: ProductsListManagerInput
    
    var products: ProductsEntity = ProductsEntity()
    
    init(manager: ProductsListManagerInput) {
        self.manager = manager
    }
    
    func fetch() {
        manager.getList(completion: { products in
            self.products = MockyMapper.parse(from: products)
            self.output?.fetched(products: self.products)
        })
    }
}
