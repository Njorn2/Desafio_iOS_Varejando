//
//  EndPoint.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 11/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

public typealias CompletionHandler = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void?

protocol EndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var task: HTTPTask { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
}

extension EndPoint {
    var headers: HTTPHeaders? {
        return nil
    }
}
