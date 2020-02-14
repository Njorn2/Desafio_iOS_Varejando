//
//  ProductRatingInteractor.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class ProductRatingInteractor: ProductRatingInteractorInput {
    weak var output: ProductRatingInteractorOutput?
    var manager: ProductRatingManagerInput
    
    var rating: RatingEntity = RatingEntity()
    
    init(manager: ProductRatingManagerInput) {
        self.manager = manager
    }
    
    func fetch() {
        manager.getRating(completion: { rating in
            self.rating = MockyMapper.parse(from: rating)
            self.output?.fetched(rating: self.rating)
        })
    }
}
