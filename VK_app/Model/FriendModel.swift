//
//  FriendModel.swift
//  VK_app
//
//  Created by Alex x on 5/21/22.
//

import Foundation

struct FriendModel: Decodable {
    
    let id: Int
    let photo50: String
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }

    
    enum CodingKeys: String, CodingKey {
        
        case id
        case photo50 = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
        
    }
}
