//
//  HTTPResponse.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

enum HTTPResponse: String, Error {
    case success
    case noUserSalesForce
    case tokenExpired
    case noConnection = "No connection"
    case authentificationError = "You need to be authentificated first."
    case badRequest = "Bad request"
    case outdated = "The URL you requested is outdated"
    case failed = "Network request failed."
    case noData = "Response returned with no DATA to decode."
    case unableToDecode = "We could not decode the response."
}

extension HTTPResponse: Equatable {
    static func == (lhs: HTTPResponse, rhs: HTTPResponse) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
