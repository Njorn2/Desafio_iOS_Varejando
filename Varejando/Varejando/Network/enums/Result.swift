//
//  Result.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

enum Result<T> {
    case success
    case failure(HTTPResponse)
}

extension Result where T: Equatable {
    static func == (lhs: Result<T>, rhs: Result<T>) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case let (.failure(lhsValue), .failure(rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
