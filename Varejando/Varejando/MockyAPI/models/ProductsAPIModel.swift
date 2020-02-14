//
//  ProductsAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

public struct ProductsAPIModel: Codable {
    var products: [ProductAPIModel]?
    var count: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case products = "produtos"
        case count = "quantidade"
    }
}
