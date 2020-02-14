//
//  ProductModelAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductModelAPIModel: Codable {
    var sku: Int?
    var name: String?
    var available: Bool = false
    var marketplace: MarketplaceAPIModel?
    var price: PriceAPIModel?
    var images: [ProductImagesAPIModel]?
    var services: [ServicesAPIModel]?
    
    enum CodingKeys: String, CodingKey {
        case sku
        case name = "nome"
        case available = "disponivel"
        case marketplace
        case price = "preco"
        case images = "imagens"
        case services = "servicos"
    }
}
