//
//  ProductImagesAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductImagesAPIModel: Codable {
    var id: Int?
    var name: String?
    var height: Double = 0
    var width: Double = 0
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case height = "altura"
        case width = "largura"
        case url
    }
}
