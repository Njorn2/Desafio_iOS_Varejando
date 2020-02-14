//
//  ProductDetailManager.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductDetailManager: ProductDetailManagerInput {
    
    var object = ProductDetailAPIModel()
    
    func getDetail(completion: @escaping ProductDetailHandler) {
        MockyAPI.shared.getProductDetail(completion: { object in
            self.object = object
            completion(object)
        })
    }
}
