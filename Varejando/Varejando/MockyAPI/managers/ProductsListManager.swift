//
//  ProductsListManager.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
class ProductsListManager: ProductsListManagerInput {
    var object = ProductsAPIModel()
    
    func getList(completion: @escaping ProductsListHandler) {
        MockyAPI.shared.getListProducts(completion: { object in
            self.object = object
            completion(object)
        })
    }
}
