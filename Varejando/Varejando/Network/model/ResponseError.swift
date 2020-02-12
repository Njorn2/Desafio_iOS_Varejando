//
//  ResponseError.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 09/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

/*!
 @brief Struct de erro, criada para manipular os erros de response dos requests.
 @discussion Quando algum erro ocorrer antes, durante ou depois de um request, retornaremos este objeto para o usuário.
  
  @field Message: mensagem de erro para o usuário.
  @field Error: o erro retornado pelo response ou por algum try/catch.
 */
public struct ResponseError {
    var message: String?
    var error: Error?
    
    init(message: String?, error: Error?) {
        self.error = error
        self.message = message
    }
}
