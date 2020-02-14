//
//  PaymentMethodAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct PaymentMethodAPIModel: Codable {
    var price: Double = 0
    var hasDiscount: Bool = false
    var description: String?
    var discountPercent: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case price = "preco"
        case hasDiscount = "possuiDesconto"
        case description = "descricao"
        case discountPercent = "porcentagemDesconto"
    }
}
