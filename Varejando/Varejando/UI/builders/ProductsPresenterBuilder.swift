//
//  ProductsViewControllerBuilder.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 15/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductsPresenterBuilder {
    
    static func make(interactor: ProductsListInteractorInput, router: ProductsRouter) -> ProductsPresenter {
        let presenter = ProductsPresenter(interactor: interactor, router: router)
        
        return presenter
    }
}
