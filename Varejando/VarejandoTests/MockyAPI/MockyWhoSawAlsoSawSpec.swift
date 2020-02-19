//
//  MockyWhoSawAlsoSawSpec.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 19/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

class MockyWhoSawAlsoSawSpec: QuickSpec {
    var done: (() -> Void)?
    override func spec() {
        describe("Test Products Simple Interactor") {
            context("Requesting Products Simple") {
                it("Who saw, also saw") {
                    let interactor = WhoSawAlsoSawInteractorBuilder.make(manager: WhoSawAlsoSawManager())
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

extension MockyWhoSawAlsoSawSpec: WhoSawAlsoSawOutput {
    func fetched(products: [ProductSimpleEntity]) {
        expect(products).toNot(beNil())
        expect(products).to(beAKindOf([ProductSimpleEntity].self))
        expect(products.isEmpty).toNot(beTrue())
        if let mDone = self.done {
            mDone()
        }
    }
}
