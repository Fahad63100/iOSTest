//
//  WebServicesHelper.swift
//  SelectItemControllerSample
//
//  Created by keygx on 2018/03/04.
//  Copyright © 2018年 keygx. All rights reserved.
//

import Foundation

class WebServicesHelper
{
    static let sharedInstance = WebServicesHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    
    
    func requestAuthorization() -> Void
    {
        let headers = [
            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "cache-control": "no-cache",
            "Postman-Token": "6fbee882-e4b0-49df-8d09-f102eac4a583"
        ]
        
        let parameters = [
            [
                "name": "email",
                "value": "athar@gmail.com"
            ],
            [
                "name": "password",
                "value": "123456"
            ]
        ]
        
        let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
        
        var body = ""
        var error: NSError? = nil
        for param in parameters {
            let paramName = param["name"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if let filename = param["fileName"] {
                let contentType = param["content-type"]!
                let fileContent = String(contentsOfFile: filename, encoding: String.Encoding.utf8)
                if (error != nil) {
                    print(error)
                }
                body += "; filename=\"\(filename)\"\r\n"
                body += "Content-Type: \(contentType)\r\n\r\n"
                body += fileContent
            } else if let paramValue = param["value"] {
                body += "\r\n\r\n\(paramValue)"
            }
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://216.200.116.25/around-uae/api/login")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }

}
