//
//  ProductsRatingSpec.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 14/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class ProductsRatingSpec: QuickSpec {
    var done: (() -> Void)?
    override func spec() {
        describe("Test Products Rating Interactor") {
            context("Requesting Products Ratinng") {
                it("Products Rating") {
                    let interactor = ProductsRatingInteractorBuilder.make(manager: ProductRatingManager())
                    interactor.output = self
                    waitUntil(timeout: 30) { done in
                        interactor.fetch()
                        self.done = done
                    }
                }
            }
        }
    }
}

extension ProductsRatingSpec: ProductRatingInteractorOutput {
    func fetched(rating: RatingEntity) {
        expect(rating).toNot(beNil())
        expect(rating).to(beAKindOf(RatingEntity.self))
        expect(rating.opinions?.isEmpty).toNot(beTrue())
        expect(rating.count ?? 0 > 0).to(beTrue())
        if let mDone = self.done {
            mDone()
        }
    }
}
