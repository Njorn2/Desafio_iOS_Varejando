//
//  MockyAPI.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

enum Paths: String {
    case list = "/5d1b4f0f34000074000006dd"
    case rating = "/5d1b4f9134000078000006e0"
    case detail = "/5d1b4fd23400004c000006e1"
    case whoSawAlsoSaw = "/5d1b50063400000f000006e7"
    case buyTogether = "/5d1b505134000074000006ec"
    case whoSawBought = "/5d1b507634000054000006ed"
}

struct Router: EndPoint {
    private var url = "http://www.mocky.io/v2"
    var baseURL: URL {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL.")
        }
        return url
    }
    
    var path: String = ""
    
    var task: HTTPTask {
        return .request
    }
    
    var httpMethod: HTTPMethod {
        return HTTPMethod.GET
    }
}

class MockyAPI {
    static let shared = MockyAPI()
    
    var router = Router()
    var decoder: JSONDecoder?
    
    private init(){
        decoder = JSONDecoder()
        decoder?.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func getListProducts(completion: @escaping ProductsListHandler) {
        router.path = Paths.list.rawValue
        HTTPRequest.instance.request(route: router, completion: { data, response, error in
            if let decode = self.decoder, let mData = data {
                let products = try decode.decode(ProductsAPIModel.self, from: mData)
                completion(products)
            }
        })
    }
    
    func getProductDetail(completion: @escaping ProductDetailHandler) {
        router.path = Paths.detail.rawValue
        HTTPRequest.instance.request(route: router, completion: { data, response, error in
            if let decode = self.decoder, let mData = data {
                let product = try decode.decode(ProductDetailAPIModel.self, from: mData)
                completion(product)
            }
        })
    }
    
    func getProductRating(completion: @escaping ProductRatingHandler) {
        router.path = Paths.rating.rawValue
        HTTPRequest.instance.request(route: router, completion: { data, response, error in
            if let decode = self.decoder, let mData = data {
                let rating = try decode.decode(RatingAPIModel.self, from: mData)
                completion(rating)
            }
        })
    }
    
    func getAlsoSaw(completion: @escaping ProductsSimpleHandler) {
        self.getSimpleProducts(path: Paths.whoSawAlsoSaw, completion: completion)
    }
    
    func getBuyTogether(completion: @escaping ProductsSimpleHandler) {
        self.getSimpleProducts(path: Paths.buyTogether, completion: completion)
    }
    
    func getAlsoSawBought(completion: @escaping ProductsSimpleHandler) {
        self.getSimpleProducts(path: Paths.whoSawBought, completion: completion)
    }
    
    private func getSimpleProducts(path: Paths, completion: @escaping ProductsSimpleHandler) {
        router.path = path.rawValue
        HTTPRequest.instance.request(route: router, completion: { data, response, error in
            if let decode = self.decoder, let mData = data {
                let products = try decode.decode([ProductSimpleAPIModel].self, from: mData)
                completion(products)
            }
        })
    }
}
