//
//  ProductDetailEntity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ProductDetailEntity {
    var id: Int?
    var name: String?
    var description: String?
    var withdrawInStore: Bool = false
    var categories: [CategoryEntity]?
    var moreInformations: [InformationEntity]?
    var brand: BrandEntity?
    var model: ModelEntity?
    var video: String?
}
