//
//  ResponseError.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 09/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation


public struct ResponseError {
    var message: String?
    var error: Error?
    
    init(message: String?, error: Error?) {
        self.error = error
        self.message = message
    }
}
