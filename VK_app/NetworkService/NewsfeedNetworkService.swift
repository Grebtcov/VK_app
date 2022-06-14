//
//  NewsfeedNetworkService.swift
//  VK_app
//
//  Created by Alex x on 5/21/22.
//

import Foundation

class NewsfeedNetworkService {
    
    static func getNewsfeed(comletion: @escaping(NewsModel)-> ()) {
        
        var urlComponents = URLComponents(string: "https://api.vk.com/method/newsfeed.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "filters", value: "post,photo"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        NetworkService.shared.sendGetRequest(url: url) { data in
            
            guard let response = try? JSONDecoder().decode(NewsConteiner.self, from: data) else { return }
            
            comletion(response.response)
        }
        
        
    }
    
}


