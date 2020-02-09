//
//  HttpRequest.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 08/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

typealias HttpRequestReponse = ((Any?, ResponseError?) -> Void)

public class HTTPRequest {
    
    static let instance = HTTPRequest()
    
    private init(){}
    
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
    
    private func buildRequest(url: String) -> URLRequest? {
        guard let mURL = URL(string: url) else {
            return nil
        }
        return URLRequest(url: mURL)
    }
    
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
