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
        let client_id:String = "312e4222e4711b50e4c2"
        let client_secret:String = "edfa2b74bd0d9ce3b906b970e66ce929cf9026c8"
        //username
        let scopStr:String = "user"
        let stateStr:String = "gddfh3454564bgd"
        
        let usernameStr:String = "fahad63100"
        
        // Build the body message to request the token to the web app
        let bodyStr:String = "client_id=" + client_id + "&client_secret=" + client_secret + "&redirect_uri=" + Globals.shared.kOAuth2__AuthorizationCallbackURL + "&scope=" + scopStr + "&state=" + stateStr + "username=" + usernameStr
        
        // Setup the request
        let myURL:URL = NSURL(string: "https://api.github.com/authorizations")! as URL
        let request = NSMutableURLRequest(url: myURL)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.setValue(client_id, forHTTPHeaderField: "client_id")
        request.setValue(client_secret, forHTTPHeaderField: "client_secret")
        request.setValue(Globals.shared.kOAuth2__AuthorizationCallbackURL, forHTTPHeaderField: "redirect_uri")
        request.setValue(scopStr, forHTTPHeaderField: "scope")
        request.setValue(stateStr, forHTTPHeaderField: "state")
        request.setValue(usernameStr, forHTTPHeaderField: "username")
        
        request.httpBody = bodyStr.data(using: String.Encoding.utf8)!
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            if let unwrappedData = data {
                
                do {
                    
                    // Convert the Json object to an array of dictionaries
                    let tokenDictionary:NSDictionary = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    // Get the token
                    let token:String = tokenDictionary["access_token"] as! String
                    
                    // Keep record of the token
//                    UserDefaults.standard.setva

                    
                }
                catch {
                    // Wrong credentials
                    
                    
                    
                }
            }
        }
        task.resume()
        
        
        
    }

}
