//
//  ProductRatingManagerInput.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

typealias ProductRatingHandler = ((RatingAPIModel) -> Void)

protocol ProductRatingManagerInput {
    func getRating(completion: @escaping ProductRatingHandler)
}
