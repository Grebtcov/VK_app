//
//  GroupModel.swift
//  VK_app
//
//  Created by Alex x on 5/12/22.
//

import Foundation

struct GroupModel: Decodable {
    
    let id: Int
//    let isAdmin: Int
//    let isAdvertiser: Int
//    let isClosed: Int
    let isMember: Int
    let name: String
//    let photo100: String
//    let photo200: String
    let photo50: String
//    let screenName: String
//    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id
//        case isAdmin = "is_admin"
//        case isAdvertiser = "is_advertiser"
//        case isClosed = "is_closed"
        case isMember = "is_member"
        case name
//        case photo100 = "photo_100"
//        case photo200 = "photo_200"
        case photo50 = "photo_50"
//        case screenName = "screen_name"
//        case type
    }
    
    
}
