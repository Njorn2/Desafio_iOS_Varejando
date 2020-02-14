//
//  ValueAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct ValueAPIModel: Codable {
    var name: String?
    var value: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case value = "valor"
    }
}
