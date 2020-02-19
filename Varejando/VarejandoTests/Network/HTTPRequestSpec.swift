//
//  RequestSpec.swift
//  VarejandoTests
//
//  Created by Ruan Gustavo de Oliveira on 09/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Varejando

struct RouterMock: EndPoint {
    var url = "https://api.tibiadata.com/v2"
    var urn = "worlds.json"
    
    var baseURL: URL {
        guard let mURL = URL(string: url) else {
            fatalError("Invalid URL")
        }
        return mURL
    }
    
    var path: String {
        return urn
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
}

public class RequestSpec: QuickSpec {
    override public func spec() {
        let request = HTTPRequest.instance
        var router = RouterMock()
        
        describe("The Get response from an API") {
            context("Get Methods.") {
                it("Response Success. Error must be Nil") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(route: router, completion: { _, _, error in
                            expect(error).to(beNil())
                            done()
                        })
                    }
                }
                it("Response Success. Response Data must not be Nil") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(route: router, completion: { data, _, _ in
                            expect(data).toNot(beNil())
                            done()
                        })
                    }
                }
                it("Response Success. Response must not be a Imagem") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(route: router, completion: { _, response, _ in
                            var isImage = false
                            if let mimeType = response?.mimeType, mimeType.hasPrefix("image") {
                                isImage = true
                            }
                            expect(isImage).toNot(beTrue())
                            done()
                        })
                    }
                }
                it("Response Success. Response must be a Imagem") {
                    router.url = "https://www.tibiawiki.com.br/"
                    router.urn = "images/7/75/Demon.gif"
                    waitUntil(timeout: 30) { done in
                        request.request(route: router, completion: { _, response, _ in
                            var isImage = false
                            if let mimeType = response?.mimeType, mimeType.hasPrefix("image") {
                                isImage = true
                            }
                            expect(isImage).to(beTrue())
                            done()
                        })
                    }
                }
            }
        }
    }
}
