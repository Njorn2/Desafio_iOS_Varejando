//
//  ProductEntity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductEntity {
    var id: Int? = -1
    var sku: Int? = -1
    var name: String? = ""
    var available: Bool? = false
    var description: String? = ""
    var image: String? = ""
    var rating: Double? = 0
    var price: PriceEntity?
}
