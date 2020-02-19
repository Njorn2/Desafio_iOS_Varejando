//
//  NetworkLog.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 11/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import UIKit

class HTTPLog {
    class func log(with request: URLRequest, response: URLResponse?, data: Data?) {
        let title = "\n -_-_-_-_-_- Output HTTPRequest -_-_-_-_-_- "
        let end = "\n -_-_-_-_-_- END HTTPRequest -_-_-_-_-_- "
        let jump = "\n"
        let URLRequest = "URL Request: "
        let HTTPStatusCode = "HTTP Status Code: "
        var outPut = ""
        
        print(title)
        defer {
            print(end)
        }

        if let body = data {
            let strData = NSString(data: body, encoding: String.Encoding.utf8.rawValue) as String? ?? ""
            outPut += jump + strData
        }
        outPut += jump
        
        if let resp = response as? HTTPURLResponse {
            outPut += URLRequest
            outPut += String(describing: resp.url)
            outPut += jump
            outPut += HTTPStatusCode
            outPut += String(describing: resp.statusCode)
        }
        outPut += jump
        
        print(outPut)
    }
}
