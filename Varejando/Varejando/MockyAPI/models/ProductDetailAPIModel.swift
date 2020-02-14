//
//  ProductDetailAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductDetailAPIModel: Codable {
    var id: Int?
    var name: String?
    var description: String?
    var withdrawInStore: Bool = false
    var categories: [CategoryAPIModel]?
    var moreInformations: [InformationAPIModel]?
    var brand: BrandAPIModel?
    var model: ModelAPIModel?
    var video: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nnome"
        case description = "descricao"
        case withdrawInStore = "retiraEmLoja"
        case categories = "categorias"
        case moreInformations = "maisInformacoes"
        case brand = "marca"
        case model = "modelo"
        case video = "urlVideo"
    }
}
