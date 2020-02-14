//
//  RatingAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct RatingAPIModel: Codable {
    var rating: Double?
    var count: Int?
    var opinions: [OpinionAPIModel]?
    
    enum CodingKeys: String, CodingKey {
        case rating = "classificacao"
        case count = "quantidade"
        case opinions = "opinioes"
    }
}
