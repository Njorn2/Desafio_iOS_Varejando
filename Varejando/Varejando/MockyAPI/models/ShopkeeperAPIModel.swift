//
//  ShopkeeperAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ShopkeeperAPIModel: Codable {
    var id: Int?
    var name: String?
    var price: Double?
    var quicklyWithdraw: Bool = false
    var buyOnline: Bool = false
    var elected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case quicklyWithdraw = "retiraRapido"
        case buyOnline = "compraOnline"
        case elected = "eleito"
    }
}
