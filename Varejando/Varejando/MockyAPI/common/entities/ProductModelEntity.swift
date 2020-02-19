//
//  ProductModelEntity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductModelEntity {
    var sku: Int?
    var name: String?
    var available: Bool = false
    var marketplace: MarketplaceEntity?
    var price: PriceEntity?
    var images: [ImageEntity]?
    var services: [ServicesEntity]?
}
