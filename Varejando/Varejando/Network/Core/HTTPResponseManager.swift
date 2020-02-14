//
//  HTTPResponseManager.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

class HTTPResponseManager {
    class func handleHttpResponse(_ response: URLResponse) -> Result<HTTPResponse> {
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...299:
                return .success
            case 401...500:
                return .failure(HTTPResponse.authentificationError)
            case 501...599:
                return .failure(HTTPResponse.badRequest)
            case 600:
                return .failure(HTTPResponse.outdated)
            default:
                return .failure(HTTPResponse.failed)
            }
        } else {
            return .success
        }
    }
}
