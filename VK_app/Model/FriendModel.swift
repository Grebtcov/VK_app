//
//  FriendModel.swift
//  VK_app
//
//  Created by Alex x on 5/21/22.
//

import Foundation

struct FriendModel: Decodable {
    
    let id: Int
//    let trackCode:
    let photo50: String
    let firstName: String
    let lastName: String
//    let canAccessClosed:
//    let isClosed:
    
    enum CodingKeys: String, CodingKey {
        
        case id
//        case trackCode = "track_code"
        case photo50 = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
//        case canAccessClosed = "can_access_closed"
//        case isClosed = "is_closed"
        
    }
    
}
