//
//  MarketplaceAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct MarketplaceAPIModel: Codable {
    var biggestPrice: Double = 0
    var lowestPrice: Double = 0
    var shopkeeperDefault: ShopkeeperAPIModel?
    var featuredShopkeepers: [ShopkeeperAPIModel]?
    
    enum CodingKeys: String, CodingKey {
        case biggestPrice = "maiorPreco"
        case lowestPrice = "menorPreco"
        case shopkeeperDefault = "lojistaPadrao"
        case featuredShopkeepers = "lojistasEmDestaque"
    }
}
