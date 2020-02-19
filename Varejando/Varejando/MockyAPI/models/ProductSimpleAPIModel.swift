//
//  ProductSimpleAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductSimpleAPIModel: Codable {
    var id: Int?
    var sku: Int?
    var name: String?
    var image: String?
    var currentPrice: Double = 0
    var previousPrice: Double =  0
    var purchasePercent: Double = 0
    var rating: Double?
    var installment: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sku
        case name = "nome"
        case image = "imagemUrl"
        case currentPrice = "precoAtual"
        case previousPrice = "precoAnterior"
        case purchasePercent = "percentualCompra"
        case rating = "classificacao"
        case installment = "parcelamento"
    }
}
