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
typealias HttpRequestReponse = ((Data?, URLResponse?, Error?) -> Void)

/*!
 @class HTTPRequest
 @brief Classe designada para requisicóes WEB.
 @description Designada para consumir APIs ou endpoints retornando objetos, arquivos, imagens ou HTMLs.
 */
class HTTPRequest: NSObject, HTTPRouter {
    
    
    
    /*! @field instance - Singleton */
    static let instance = HTTPRequest()
    
    private var task: URLSessionTask?
    
    private override init(){}

    func request(route: EndPoint, completion: @escaping HttpRequestReponse) {
//        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        do {
            let request = try self.buildRequest(route: route)
            task = URLSession.shared.dataTask(with: request) { data, response, error in
                HTTPLog.log(with: request, response: response, data: data)
                
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
            }
            task?.resume()
        } catch {
            DispatchQueue.main.async {
                completion(nil, nil, error)
            }
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    /*!
     @method private buildRequest
     @brief Cria a URLRequest
     @description Cria o URLRequest, objeto de request utilizado para realizar requisições com tipos diferentes de metodos http.
     @field url - parametro necessário para criar o objeto, deve ser uma URL válida.
     */
    private func buildRequest(route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalCacheData,
                                 timeoutInterval: 30.0)
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
            case .request:
                self.addHeader(headers: route.headers, request: &request)
            case let .requestParameters(bodyParameters: bodyParameters, urlParameters: urlParameters):
                self.addHeader(headers: route.headers, request: &request)
                try self.addParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case let .requestParametersAndHeaders(bodyParameters: bodyParameters, urlParameters: urlParameters, headers: addHeader):
                self.addHeader(headers: addHeader, request: &request)
                try self.addParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
        } catch {
            throw error
        }
        return request
    }
    
    /*!
     @method private execute
     @brief Executa a requisição.
     @description Executa a requisição utlizado o URLRequest criado acima
     @field request - Objeto necessário para realização do request, contendo headers, body e URL necessário.
     @field completion - closure executdo no fim da requisição.
     */
    public func execute(route: EndPoint, completion: @escaping HttpRequestReponse) {

//        do {
//            let request = try self.buildRequest(route: route)
//            URLSession.shared.dataTask(with: request) { data, response, error in
//                guard
//                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                    let mimeType = response?.mimeType,
//                    let data = data, error == nil
//                    else { return }
//                DispatchQueue.main.async() {
//                    if mimeType.hasPrefix("image") {
//                        let image = UIImage(data: data)
//                        completion(image, nil)
//                    }else {
//                        //                    let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                        completion(data, nil)
//                    }
//                }
//            }.resume()
//        } catch {
//            DispatchQueue.main.async {
//                completion(nil, nil, error)
//            }
//        }
    }
    
    private func addParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        
        do {
            if let body = bodyParameters {
                try JSONParametersEncoder.encode(urlRequest: &request, with: body)
            }
            if let url = urlParameters {
                try JSONParametersEncoder.encode(urlRequest: &request, with: url)
            }
        } catch {
            throw error
        }
        
    }
    
    private func addHeader(headers: HTTPHeaders?, request: inout URLRequest) {
        guard let mHeaders = headers else { return }
        mHeaders.forEach({ (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        })
    }
}

extension HTTPRequest: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let trust = challenge.protectionSpace.serverTrust else {
            return
        }
        let credential = URLCredential(trust: trust)
        completionHandler(.useCredential, credential)
    }
}
