//
//  HttpMethod.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 09/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation

/*!
 @enum HTTPMethod
 @brief Metodos HTTP disponiveis para os requests
 @description Ao realizar um request, o usuário poderá/deverá escolher um dos metodos abaixo.
 
 @field GET - Metodo GET, apenas requisita um response de um Endpoint
 @field POST - Metodo POST, Utilizado para enviar um Objeto para o Endpoint e resceber uma resposta de acordo.
 @field PUT - Metodo PUT, Utlizado para realizar um update ou inserção de um novo objeto do Endpoint, seja uma atualização de cadastro, ou criação de um novo cadastro.
 @field GET - Metodo PATCH, Assim como o PUT, serve para realizar updates em um objeto do Endpoint, porém com o PATCH poderá realizar alterações parciais no objeto, diferente do PUT  que oara atualizar, substituirá o objeto por completo com os novos dados.
 @field DELETE - Metodo DELETE, Remove/Deleta um objeto do Endpoint, muito utilizado para deletar contas de usuários de um cadastro, ou um produto de um cadastro de produtos.
 */
public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case PATCH
    case DELETE
}
