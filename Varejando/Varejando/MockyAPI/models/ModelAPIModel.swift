//
//  ModelAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ModelAPIModel: Codable {
    var skus: [Int]?
    var productModel: ProductModelAPIModel?
    
    enum CodingKeys: String, CodingKey {
        case skus
        case productModel = "padrao"
    }
}
