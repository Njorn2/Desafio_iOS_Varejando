//
//  ShopkeeperViewModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 18/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ShopkeeperViewModel {
    var id: Int?
    var name: String?
    var price: Double?
    var quicklyWithdraw: Bool? = false
    var onlineShop: Bool? = false
    var elected: Bool? = false
    var featuredShopkeepers: [ShopkeeperViewModel]?
}
