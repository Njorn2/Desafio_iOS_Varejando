//
//  MockyProductsDetails.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class MockyProductsDetailsSpec: QuickSpec {
    var done: (() -> Void)?
    override func spec() {
        describe("Test Products Details Interactor") {
            context("Requesting Deatails of Products") {
                it("Products Details ") {
                    let interactor = ProductsDetailInteractorBuilder.make(manager: ProductDetailManager())
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

extension MockyProductsDetailsSpec: ProductDetailInteractorOutput {
    func fetched(products: ProductDetailEntity) {
        expect(products).toNot(beNil())
        expect(products).to(beAKindOf(ProductDetailEntity.self))
        if let mDone = self.done {
            mDone()
        }
    }
}
