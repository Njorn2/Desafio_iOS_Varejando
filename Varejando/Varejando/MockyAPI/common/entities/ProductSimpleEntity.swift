//
//  ProductSimpleEntiuty.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductSimpleEntity {
    var id: Int?
    var sku: Int?
    var name: String?
    var image: String?
    var currentPrice: Double = 0
    var previousPrice: Double =  0
    var purchasePercent: Double = 0
    var installment: String?
}
