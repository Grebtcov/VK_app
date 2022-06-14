//
//  GroupModel.swift
//  VK_app
//
//  Created by Alex x on 5/12/22.
//

import Foundation

struct GroupModel: Decodable {
    
    let id: Int
    let isMember: Int
    let name: String
    let photo50: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case isMember = "is_member"
        case name
        case photo50 = "photo_50"
    }
    
    
}
