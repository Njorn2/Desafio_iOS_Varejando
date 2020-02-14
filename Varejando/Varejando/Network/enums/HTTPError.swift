//
//  HTTPError.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 12/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

public enum HTTPError: String, Error, Equatable {
    case parametersNil = "Parameters are nil"
    case encodingFailed = "Encode Fail"
    case missingURL = "Missing URL"
}
