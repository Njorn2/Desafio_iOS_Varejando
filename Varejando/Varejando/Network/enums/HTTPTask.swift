//
//  HTTPTask.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 11/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

public enum HTTPTask: Equatable {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, headers: HTTPHeaders?)
    
    public static func == (lhs: HTTPTask, rhs: HTTPTask) -> Bool {
        switch(lhs, rhs) {
        case(.request, .request):
            return true
        case let (.requestParameters(bodyParameters: lhsBody, urlParameters: lhsURL),
                  .requestParameters(bodyParameters: rhsBody, urlParameters: rhsURL)
        ):
             return((lhsBody?.description == rhsBody?.description) && (lhsURL?.description == rhsURL?.description))
        case let (.requestParametersAndHeaders(bodyParameters: lhsBody, urlParameters: lhsURL, headers: lhsHeader),
                  .requestParametersAndHeaders(bodyParameters: rhsBody, urlParameters: rhsURL, headers: rhsHeader)
            ):
            return ((lhsBody?.description == rhsBody?.description) && (lhsURL?.description == rhsURL?.description) && (lhsHeader?.description == rhsHeader?.description))
        default:
            return false
        }
    }
}
