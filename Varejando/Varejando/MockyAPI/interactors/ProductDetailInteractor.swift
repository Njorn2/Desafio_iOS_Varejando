//
//  ProductDetailInteractor.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductDetailInteractor: ProductDetailInteractorInput {
    weak var output: ProductDetailInteractorOutput?
    var manager: ProductDetailManagerInput
    
    var products: ProductDetailEntity = ProductDetailEntity()
    
    init(manager: ProductDetailManagerInput) {
        self.manager = manager
    }
    
    func fetch() {
        manager.getDetail(completion: { products in
            self.products = MockyMapper.parse(from: products)
            self.output?.fetched(products: self.products)
        })
    }
}
