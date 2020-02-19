//
//  MediaGaleryAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct MediaGaleryAPIModel: Codable {
    var type: String?
    var link: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "tipo"
        case link
    }
}
