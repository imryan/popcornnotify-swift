//
//  PopcornNotify.swift
//  PopcornNotify iOS
//
//  Created by Ryan Cohen on 3/4/18.
//

import Foundation

open class PopcornNotify {
    
    // MARK: - Attributes
    
    /// API endpoint
    private let endpoint = "https://popcornnotify.com/notify"
    
    /// User's API key
    private var apiKey: String?
    
    /// Initialize with API key
    ///
    /// - Parameter apiKey: Your registered API key
    public init(withAPIkey apiKey: String) {
        // Assert that we've got an API key
        assert(apiKey.isEmpty == false, "API key must not be empty.")
        
        // Assign the API key duh
        self.apiKey = apiKey
    }
    
    // MARK: - Notify
    
    /// Notify via text or email with subject/message/recipients
    ///
    /// - Parameters:
    ///   - recipients: Array of recipients. `["name@email.com", "17329081234", ...]` or just "name@email.com"
    ///   - message: The message body
    ///   - subject: The message subject
    ///   - handler: Closure returning an `Error` object if something goes wrong, otherwise nil for success.
    open func notify(recipients: String..., message: String, subject: String,
                     handler: @escaping (_ error: Error?) -> ()) {
        
        // Get API key ase UTF-8 data
        guard let apiKeyData = apiKey?.data(using: .utf8) else {
            let error = NSError(domain: "com.popcornnotify.MissingAPIKey", code: -1, userInfo: [NSLocalizedDescriptionKey : "API key missing."])
            handler(error)
            return
        }
        
        // Create a request to the base URL endpoint
        var request = URLRequest(url: URL(string: endpoint)!)
        
        // Create Base64 representation of API key to authenticate with
        let apiKeyBase64 = apiKeyData.base64EncodedString()
        request.setValue("Basic \(apiKeyBase64)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        
        // Format recipients by comma
        let recipientsString = recipients.joined(separator: ",")
        request.httpBody = "recipients=\(recipientsString)&message=\(message)&subject=\(subject)".data(using: .utf8)
        
        // Create data task with our request and return according to the response
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse, let data = data {
                // Failed request, probably incorrect API key
                if response.statusCode == 401 {
                    // Parse out error message
                    if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : Any] {
                        // Return server error
                        let error = NSError(domain: "com.popcornnofity.Error", code: -2,
                                            userInfo: [NSLocalizedDescriptionKey : json["error"] ?? ""])
                        handler(error)
                    }
                    return
                }
                else if response.statusCode == 200 || response.statusCode == 201 {
                    // Successful email/text
                    handler(nil)
                    return
                }
            }
            
            // Return an early error
            handler(error)
        }
        
        task.resume()
    }
}
