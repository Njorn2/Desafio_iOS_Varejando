//
//  OpinionEnity.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

struct OpinionEntity {
    var client: String?
    var date: String?
    var comment: String = ""
    var note: Double = 0
    var title: String = ""
    var generalAvaliation: String = ""
    var stateAvaliation: String?
    var like: Int = 0
    var dislike: Int = 0
    var mediaGalery: [MediaGaleryEnity]?
    var idReview: Int?
    var descriptionNote: String?
    var cityAvaliation: String?
}
