//
//  ShopkeeperEntity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ShopkeeperEntity {
    var id: Int?
    var name: String?
    var price: Double?
    var quicklyWithdraw: Bool = false
    var buyOnline: Bool = false
    var elected: Bool = false
}
