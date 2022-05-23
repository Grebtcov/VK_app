//
//  FrendsNetworkService.swift
//  VK_app
//
//  Created by Alex x on 5/7/22.
//

import Foundation

class FriendsNetworkService {
    
    static func getFriends(comletion: @escaping([FriendModel])-> ()) {
        
        var urlComponents = URLComponents(string: "https://api.vk.com/method/friends.get")
        urlComponents?.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.shared.userId)"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents?.url else { return }
        
        NetworkService.shared.sendGetRequest(url: url) { data, _  in
            guard let friends = try? JSONDecoder().decode(ArrayResponse<FriendModel>.self, from: data) else { return }
            
            comletion(friends.response)
        }
        
        
    }
    
}
