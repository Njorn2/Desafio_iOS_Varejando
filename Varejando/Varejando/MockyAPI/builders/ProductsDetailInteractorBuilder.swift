//
//  ProductsDetailInteractorBuilder.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductsDetailInteractorBuilder {
    static func make(manager: ProductDetailManagerInput) -> ProductDetailInteractor {
        
        return ProductDetailInteractor(manager: manager)
    }
}
