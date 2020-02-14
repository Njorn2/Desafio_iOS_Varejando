//
//  PaymentMethodEntity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct PaymentMethodEntity {
    var price: Double = 0
    var hasDiscount: Bool = false
    var description: String?
    var discountPercent: Int = 0
}
