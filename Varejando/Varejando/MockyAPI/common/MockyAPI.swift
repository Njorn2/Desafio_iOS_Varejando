//
//  MockyAPI.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class MockyAPI {
    static let shared = MockyAPI()
    
    let baseURL = "http://www.mocky.io/v2"
    let httpMethod = HTTPMethod.GET
    
    let listPath = "/5d1b4f0f34000074000006dd"
    let ratingPath = "/5d1b4f9134000078000006e0"
    let detailPath = "/5d1b4fd23400004c000006e1"
    let whoSawAlsoSaw = "/5d1b50063400000f000006e7"
    let buyTogetherPath = "/5d1b505134000074000006ec"
    let whoSawBoughtPath = "/5d1b507634000054000006ed"
    
    var decoder: JSONDecoder?
    
    private init(){
        decoder = JSONDecoder()
        decoder?.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getListProducts(completion: @escaping ProductsListHandler) {
        HTTPRequest.instance.request(url: baseURL + listPath, method: httpMethod, parameters: nil, completion: {response, error in
            if let data = response as? Data, let decode = self.decoder {
                let products = try decode.decode(ProductsAPIModel.self, from: data)
                completion(products)
            }
        })
    }
    
    func getProductDetail(completion: @escaping ProductDetailHandler) {
        HTTPRequest.instance.request(url: baseURL + detailPath, method: httpMethod, parameters: nil, completion: {response, error in
            if let data = response as? Data, let decode = self.decoder {
                let product = try decode.decode(ProductDetailAPIModel.self, from: data)
                completion(product)
            }
        })
    }
    
    func getProductRating(completion: @escaping ProductRatingHandler) {
        HTTPRequest.instance.request(url: baseURL + ratingPath, method: httpMethod, parameters: nil, completion: {response, error in
            if let data = response as? Data, let decode = self.decoder {
                let rating = try decode.decode(RatingAPIModel.self, from: data)
                completion(rating)
            }
        })
    }
    
    func getAlsoSaw(completion: @escaping ProductsSimpleHandler) {
        self.getSimpleProducts(path: whoSawAlsoSaw, completion: completion)
    }
    
    func getBuyTogether(completion: @escaping ProductsSimpleHandler) {
        self.getSimpleProducts(path: buyTogetherPath, completion: completion)
    }
    
    func getAlsoSawBought(completion: @escaping ProductsSimpleHandler) {
        self.getSimpleProducts(path: whoSawBoughtPath, completion: completion)
    }
    
    private func getSimpleProducts(path: String, completion: @escaping ProductsSimpleHandler) {
        HTTPRequest.instance.request(url: baseURL + path, method: httpMethod, parameters: nil, completion: {response, error in
            if let data = response as? Data, let decode = self.decoder {
                let products = try decode.decode([ProductSimpleAPIModel].self, from: data)
                completion(products)
            }
        })
    }
}
