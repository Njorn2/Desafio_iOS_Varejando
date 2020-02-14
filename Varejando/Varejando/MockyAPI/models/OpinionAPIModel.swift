//
//  OpinionAPIModel.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct OpinionAPIModel: Codable {
    var client: String?
    var date: String?
    var comment: String = ""
    var note: Double = 0
    var title: String = ""
    var generalAvaliation: String = ""
    var stateAvaliation: String?
    var like: Int = 0
    var dislike: Int = 0
    var mediaGalery: [MediaGaleryAPIModel]?
    var idReview: Int?
    var descriptionNote: String?
    var cityAvaliation: String?
    
    enum CodingKeys: String, CodingKey {
        case client = "cliente"
        case date = "data"
        case comment = "comentario"
        case note = "nota"
        case title = "titulo"
        case generalAvaliation = "avaliacaoGeral"
        case stateAvaliation = "avaliadorEstado"
        case like
        case dislike
        case mediaGalery = "galeriaMidia"
        case idReview
        case descriptionNote = "notaDescricao"
        case cityAvaliation = "avaliadorCidade"
     }
}
