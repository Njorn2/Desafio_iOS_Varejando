//
//  ProductRatinngManager.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductRatingManager: ProductRatingManagerInput {
    var object = RatingAPIModel()
    func getRating(completion: @escaping ProductRatingHandler) {
        MockyAPI.shared.getProductRating(completion: { object in
            self.object = object
            completion(object)
        })
    }
}
