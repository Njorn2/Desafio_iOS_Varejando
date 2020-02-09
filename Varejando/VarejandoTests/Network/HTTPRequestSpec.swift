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

public class RequestSpec: QuickSpec {
    override public func spec() {
        let request = HTTPRequest.instance
        
        describe("The Get response from an API") {
            context("Get Methods.") {
                it("URL Broken.") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(url: "url wrong.", method: HTTPMethod.GET, parameters: nil, completion: {(response, error) in
                            expect(error).toNot(beNil())
                            done()
                        })
                    }
                }
                it("Response Error.") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(url: "https://api.tibiadata.com/v2/worlds", method: HTTPMethod.GET, parameters: nil, completion: {(response, error) in
                            DispatchQueue.main.sync {
                                expect(error).toNot(beNil())
                                done()
                            }
                        })
                    }
                }
                it("Response Success. Error must be Nil") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(url: "https://api.tibiadata.com/v2/worlds.json", method: HTTPMethod.GET, parameters: nil, completion: {(response, error) in
                            expect(error).to(beNil())
                            done()
                        })
                    }
                }
                it("Response Success. Response must be Dictionary<String, Any>") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(url: "https://api.tibiadata.com/v2/worlds.json", method: HTTPMethod.GET, parameters: nil,  completion: {(response, error) in
                            expect(response).to(beAKindOf(Dictionary<String, Any>.self))
                            done()
                        })
                    }
                }
                it("Response Success. Response must be a Imagem (UIImage)") {
                    
                    waitUntil(timeout: 30) { done in
                        request.request(url: "https://tibiawiki.com.br/images/4/4a/Angry_Demon.gif", method: HTTPMethod.GET, parameters: nil,  completion: {(response, error) in
                            expect(response).to(beAKindOf(UIImage.self))
                            done()
                        })
                    }
                }
            }
        }
    }
}
