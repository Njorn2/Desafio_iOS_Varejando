//
//  ProductSimpleInteractor.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class WhoSawAlsoSawInteractor: ProductsSimpleInteractorInput {
    weak var output: ProductsSimpleInteractorOutput?
    var manager: ProductsSimpleManagerInput
    
    var products = [ProductSimpleEntity]()
    
    init(manager: ProductsSimpleManagerInput) {
        self.manager = manager
    }
    
    func fetch() {
        manager.getProducts(completion: { products in
            products.forEach({ product in
                self.products.append(MockyMapper.parse(from: product))
            })
            self.output?.fetched(products: self.products)
        })
    }
}
