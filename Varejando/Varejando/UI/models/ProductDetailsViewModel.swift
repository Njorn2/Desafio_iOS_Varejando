//
//  ProductDetailsViewModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 17/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductDetailsViewModel {
    var title: String?
    var descrption: String?
    var images: [String]?
    var sku: Int?
    var previousPrice: Double?
    var currentPrice: Double?
    var installment: String?
    var percentDiscount: Double?
    var services: [ServiceViewModel]?
    var shopkeeper: ShopkeeperViewModel?
    var rating: RatingViewModel?
    var whoSawAlsoSawModel: [ProductsListItemViewModel]?
    var buyTogetherModel: [ProductsListItemViewModel]?
    var whoSawBoughtModel: [ProductsListItemViewModel]?
}
