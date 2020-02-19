//
//  MockySimpleProducts.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 13/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class MockyWhoSawBoughtSpec: QuickSpec {
    var done: (() -> Void)?
    override func spec() {
        describe("Test Products Simple Interactor") {
            context("Requesting Products Simple") {
                it("Who Saw bought") {
                    let interactor = WhoSawBoughtInteractorBuilder.make(manager: WhoSawBoughtManager())
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

extension MockyWhoSawBoughtSpec: WhoSawBoughtOutput {
    func fetched(products: [ProductSimpleEntity]) {
        expect(products).toNot(beNil())
        expect(products).to(beAKindOf([ProductSimpleEntity].self))
        expect(products.isEmpty).toNot(beTrue())
        if let mDone = self.done {
            mDone()
        }
    }
}
