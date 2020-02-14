//
//  NetworkRouter.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 11/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

public typealias HTTPRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) throws -> Void

protocol HTTPRouter: AnyObject {
    func request(route: EndPoint, completion: @escaping HTTPRouterCompletion)
    func cancel()
}
