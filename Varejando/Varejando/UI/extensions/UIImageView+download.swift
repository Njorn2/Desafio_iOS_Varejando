//
//  UIImageView+download.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

private struct ImageRouter: EndPoint {
    var imageURL: String = ""
    var baseURL: URL {
        guard let url = URL(string: imageURL) else { fatalError("Invalid URL") }
        return url
    }
    
    var path: String {
        return ""
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
}

struct ImageError: Error {
    var message: String?
    
    init(message: String?) {
        self.message = message
    }
}

extension UIImageView {
    func download(url: String, done: ((_ error: Error?) -> Void)? = nil) {
        var router = ImageRouter()
        router.imageURL = url
        HTTPRequest.instance.request(route: router, completion: { data, response, error in
            if let error = error, let done = done {
                done(error)
            }
            if let resp = response as? HTTPURLResponse, resp.statusCode >= 401, let done = done {
                done(ImageError(message: "Image Not Found"))
            }
            if let mimeType = response?.mimeType,
                mimeType.hasPrefix("image"),
                let data = data,
                let image = UIImage(data: data) {
                
                self.image = image
                
                if let done = done {
                    done(nil)
                }
            }
        })
    }
}
