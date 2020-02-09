//
//  HttpRequest.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 08/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

/*!
 @typealias HttpRequestReponse
 @brief padrão de closure das requisições.
 @description Ao realizar um requisição, será executado retornando para o usuário os objetos ou erros retornandos durante ou após seu fim.
 
 @field Any? - Objeto retornado pela requisição.
 @field ResponseError? - Error retornado pela requisção.
 */
typealias HttpRequestReponse = ((Any?, ResponseError?) -> Void)

/*!
 @class HTTPRequest
 @brief Classe designada para requisicóes WEB.
 @description Designada para consumir APIs ou endpoints retornando objetos, arquivos, imagens ou HTMLs.
 */
public class HTTPRequest {
    
    /*! @field instance - Singleton */
    static let instance = HTTPRequest()
    
    private init(){}
    
    /*!
     @method request
     @brief Metodo publico para a realizaçãso de requests
     @description Para realizar um requisição, deverá ser chamda esta função, passando os parametros corretos.
     @field url - endpoint que será consumido.
     @field method - Tipo de metodo HTTP que será utilizado.
        - GET
        - POST
        - PUT
        - PATCH
        - DELETE
     @field parameters - Parametros que será enviado, sendo ele um objeto JSON. Pode ser nulo.
     @field completion - Closure executado após algum retorno ou erro ocorrido.
     */
    func request(url: String, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping HttpRequestReponse) {
        guard var request = self.buildRequest(url: url) else {
            completion(nil, ResponseError(message: "URL inválida! URL: \(url)", error: nil))
            return
        }
        request.httpMethod = method.rawValue
        if let params = parameters, let data = try?  JSONSerialization.data(withJSONObject: params, options: .prettyPrinted) {
            request.httpBody = data
        }
        self.execute(request: request, completion: completion)
    }
    
    /*!
     @method private buildRequest
     @brief Cria a URLRequest
     @description Cria o URLRequest, objeto de request utilizado para realizar requisições com tipos diferentes de metodos http.
     @field url - parametro necessário para criar o objeto, deve ser uma URL válida.
     */
    private func buildRequest(url: String) -> URLRequest? {
        guard let mURL = URL(string: url) else {
            return nil
        }
        return URLRequest(url: mURL)
    }
    
    /*!
     @method private execute
     @brief Executa a requisição.
     @description Executa a requisição utlizado o URLRequest criado acima
     @field request - Objeto necessário para realização do request, contendo headers, body e URL necessário.
     @field completion - closure executdo no fim da requisição.
     */
    private func execute(request: URLRequest, completion: @escaping HttpRequestReponse) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType,
                let data = data, error == nil
                else {
                    completion(nil, ResponseError(message: "Aconteceu algo errado durante o response.", error: error))
                    return
            }
            DispatchQueue.main.async() {
                if mimeType.hasPrefix("image") {
                    let image = UIImage(data: data)
                    completion(image, nil)
                }else {
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    completion(json, nil)
                }
            }
        }.resume()
    }
}
