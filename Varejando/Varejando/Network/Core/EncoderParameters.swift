//
//  EncoderParameters.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

public struct URLEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else {
            throw HTTPError.missingURL
        }
        if var urlComponents  = URLComponents(url: url, resolvingAgainstBaseURL: true), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            parameters.forEach({ key, value in
                let item = URLQueryItem(name: key, value: String(describing: value))
                urlComponents.queryItems?.append(item)
            })
            urlRequest.url = urlComponents.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}

public struct JSONParametersEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = data
        } catch {
            throw HTTPError.encodingFailed
        }
    }
}
