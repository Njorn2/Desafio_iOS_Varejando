//
//  ServicesAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ServicesAPIModel: Codable {
    var name: String?
    var sku: Int?
    var idShopkeeper: Int?
    var price: Double = 0
    var installment: String?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case sku
        case idShopkeeper = "idLojista"
        case price = "preco"
        case installment = "parcelamento"
        case type = "tipo"
    }
}
