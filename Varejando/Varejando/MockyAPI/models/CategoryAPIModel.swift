//
//  CategoryAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct CategoryAPIModel: Codable {
    var id: Int?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case description = "descricao"
    }
}
