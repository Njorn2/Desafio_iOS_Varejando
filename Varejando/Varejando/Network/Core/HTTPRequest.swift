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
 @class HTTPRequest
 @brief Classe designada para requisicóes WEB.
 @description Designada para consumir APIs ou endpoints retornando objetos, arquivos, imagens ou HTMLs.
 */
class HTTPRequest: NSObject, HTTPRouter {
    
    /*! @field instance - Singleton */
    static let instance = HTTPRequest()
    
    private var task: URLSessionTask?
    
    private override init(){}
    
    func request(route: EndPoint, completion: @escaping HTTPRouterCompletion) {
        do {
            let request = try self.buildRequest(route: route)
            task = URLSession.shared.dataTask(with: request) { data, response, error in
                HTTPLog.log(with: request, response: response, data: data)
                guard let httpResponse = response else {
                    fatalError(HTTPResponse.failed.localizedDescription)
                }
                let responseStatus = HTTPResponseManager.handleHttpResponse(httpResponse)
                
                if responseStatus == .success {
                    DispatchQueue.main.async {
                        try? completion(data, response, error)
                    }
                }
            }
            task?.resume()
        } catch {
            DispatchQueue.main.async {
                try? completion(nil, nil, error)
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
