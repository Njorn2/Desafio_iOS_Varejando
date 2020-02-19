//
//  ProductAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductAPIModel: Codable {
    var id: Int?
    var sku: Int?
    var name: String?
    var available: Bool = false
    var description: String?
    var image: String?
    var rating: Double? = 0
    var price: PriceAPIModel?
    var marketplace: MarketplaceAPIModel?
    var images: [ProductImagesAPIModel]?
    var services: [ServicesAPIModel]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sku
        case name = "nome"
        case available = "disponivel"
        case description = "descricao"
        case image = "imagemUrl"
        case rating = "classificacao"
        case price = "preco"
        case marketplace
        case images = "imagens"
        case services = "servicos"
    }
}
