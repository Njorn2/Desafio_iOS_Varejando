//
//  MarketplaceEntity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct MarketplaceEntity {
    var biggestPrice: Double = 0
    var lowestPrice: Double = 0
    var shopkeeperDefault: ShopkeeperEntity?
    var featuredShopkeepers: [ShopkeeperEntity]?    
}
