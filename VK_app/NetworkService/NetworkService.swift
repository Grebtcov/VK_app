//
//  NetworkService.swift
//  VK_app
//
//  Created by Alex x on 5/7/22.
//

import Foundation

class NetworkService {
    
    private init() {}
    
    static let shared = NetworkService()
    
    func sendGetRequest(url: URL, completion: @escaping(Data, URLResponse?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data else { return }
                completion(data, response)
        }.resume()
        
    }
}
