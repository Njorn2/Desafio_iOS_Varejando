//
//  InformationAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct InformationAPIModel: Codable {
    var description: String?
    var values: [ValueAPIModel]?
    
    enum CodingKeys: String, CodingKey {
        case description = "descricao"
        case values = "valores"
    }
}
