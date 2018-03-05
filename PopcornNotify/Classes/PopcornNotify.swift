//
//  PopcornNotify.swift
//  PopcornNotify
//
//  Created by Ryan Cohen on 3/4/18.
//

import Foundation

class PopcornNotify {
    
    // MARK: - Attributes
    
    /// API endpoint
    let endpoint = "https://popcornnotify.com/notify"
    
    /// User's API key
    private var apiKey: String?
    
    // MARK: - Initialization
    public init(withAPIkey apiKey: String) {
        self.apiKey = apiKey
    }
    
    // MARK: - Notify
    
    open func notify(recipients: String..., message: String, subject: String,
                     handler: @escaping (_ error: Error?) -> ()) {
        
        guard let apiKey = apiKey else {
            let error = NSError(domain: "com.popcornnotify.MissingAPIKey", code: -1, userInfo: nil)
            handler(error)
            return
        }
        
        var request = URLRequest(url: URL(string: endpoint)!)
        request.setValue(apiKey, forHTTPHeaderField: "POPCORNNOTIFY_API_KEY")
        request.httpMethod = "POST"
        
        let recipientsString = recipients.joined(separator: ",")
        request.httpBody = "recipients=\(recipientsString)&message=\(message)&subject=\(subject)".data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 || response.statusCode == 201 {
                    handler(nil)
                }
            }
            
            handler(error)
        }
    }
}
