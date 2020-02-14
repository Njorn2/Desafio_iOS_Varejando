//
//  ProductsListInteractorBuilder.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductsListInteractorBuilder {
    static func make(manager: ProductsListManagerInput) -> ProductsListInteractor {
        
        return ProductsListInteractor(manager: manager)
    }
}
