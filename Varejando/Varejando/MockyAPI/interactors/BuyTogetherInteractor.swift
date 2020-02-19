//
//  BuyTogetherInteractor.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

protocol BuyTogetherOutput: ProductsSimpleInteractorOutput {
}

class BuyTogetherInteractor: ProductsSimpleInteractorInput {
    weak var output: BuyTogetherOutput?
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
