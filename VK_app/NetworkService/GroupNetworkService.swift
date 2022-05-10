//
//  GroupNetworkService.swift
//  VK_app
//
//  Created by Alex x on 5/11/22.
//

import Foundation

class GroupNetworkService {
    
    static func getAllgroup(userId: Int, completion: @escaping(Any?) -> ()) {
        
        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "user_id", value: "\(userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        NetworkService.shared.sendGetRequest(url: url) { json in
            completion(json)
        }
    }
    
    static func getGroupSearch(search: String, completion: @escaping(Any?) -> ()) {
        
        var urlComponents = URLComponents(string: "https://api.vk.com/method/groups.search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "q", value: search),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        NetworkService.shared.sendGetRequest(url: url) { json in
            completion(json)
        }
    }
    
    
}
