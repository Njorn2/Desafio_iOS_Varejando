//
//  MockyAPISpec.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class MockyAPISpec: QuickSpec {
    override func spec() {
        describe("Test MockyAPI Requests") {
            context("Requesting MockyAPI") {
                it("Listing Products") {
                    waitUntil(timeout: 30) { done in
                        MockyAPI.shared.getListProducts(completion: { product in
                            expect(product).toNot(beNil())
                            expect(product).to(beAKindOf(ProductsAPIModel.self))
                            done()
                        })
                    }
                }
                it("Product Detail") {
                    waitUntil(timeout: 30) { done in
                        MockyAPI.shared.getProductDetail(completion: { product in
                            expect(product).toNot(beNil())
                            expect(product).to(beAKindOf(ProductDetailAPIModel.self))
                            done()
                        })
                    }
                }
                it("Product rating") {
                    waitUntil(timeout: 30) { done in
                        MockyAPI.shared.getProductRating(completion: { rating in
                            expect(rating).toNot(beNil())
                            expect(rating).to(beAKindOf(RatingAPIModel.self))
                            done()
                        })
                    }
                }
                it("Who saw, also saw") {
                    waitUntil(timeout: 30) { done in
                        MockyAPI.shared.getAlsoSaw(completion: { products in
                            expect(products).toNot(beNil())
                            expect(products).to(beAKindOf([ProductSimpleAPIModel].self))
                            done()
                        })
                    }
                }
                it("Buy together") {
                    waitUntil(timeout: 30) { done in
                        MockyAPI.shared.getBuyTogether(completion: { products in
                            expect(products).toNot(beNil())
                            expect(products).to(beAKindOf([ProductSimpleAPIModel].self))
                            done()
                        })
                    }
                }
                it("Who saw bought") {
                    waitUntil(timeout: 30) { done in
                        MockyAPI.shared.getAlsoSawBought(completion: { products in
                            expect(products).toNot(beNil())
                            expect(products).to(beAKindOf([ProductSimpleAPIModel].self))
                            done()
                        })
                    }
                }
            }
        }
    }
}
