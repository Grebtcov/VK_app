//
//  Response.swift
//  VK_app
//
//  Created by Alex x on 5/21/22.
//

import Foundation

struct ArrayResponse<T: Decodable>: Decodable {
    
    enum CodingKeys: CodingKey {
        
        case response
        
        enum ResponseKeys: CodingKey {
            case items
        }
    }
    
    let response: [T]
    
    // Не понимаю почему init должен быть вначале ( писали в телеге ) по стайлгайдам не нашел такую инфу
    // например стайлгайд tutu
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let groupsContainer = try container.nestedContainer(keyedBy: CodingKeys.ResponseKeys.self, forKey: .response)
        response = try groupsContainer.decode([T].self, forKey: .items)
    }
}

