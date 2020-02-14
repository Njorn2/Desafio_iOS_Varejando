//
//  MockyProductsList.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class MockyProductsList: QuickSpec {
    var done: (() -> Void)?
    override func spec() {
        describe("Test Products List Interactor") {
            context("Requesting List of Products") {
                it("Listing Products") {
                    let interactor = ProductsListInteractorBuilder.make(manager: ProductsListManager())
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

extension MockyProductsList: ProductsListInteractorOutput {
    func fetched(products: ProductsEntity) {
        expect(products).toNot(beNil())
        expect(products).to(beAKindOf(ProductsEntity.self))
        expect(products.count > 0).to(beTrue())
        expect(products.products?.isEmpty).toNot(beTrue())
        if let mDone = self.done {
            mDone()
        }
    }
}
