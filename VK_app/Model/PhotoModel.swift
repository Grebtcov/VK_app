//
//  PhotoModel.swift
//  VK_app
//
//  Created by Alex x on 5/21/22.
//

import Foundation

struct PhotoModel: Decodable {
    
    let sizes: [SizeModel]
    let text: String
    let likes: LikeModel?
    let reposts: RepostModel?
    
    func getUrlBigPhoto() -> String {
        
        let sort = sizes.sorted(by: { $0.type > $1.type })
        
        return sort.first?.url ?? ""
        
    }
}

struct SizeModel: Decodable {
    
    let height: Int
    let width: Int
    let url: String
    let type: String
}

struct LikeModel: Decodable {
    
    let count: Int
    let userLikes: Int
    
    enum CodingKeys: String, CodingKey {
        
        case count
        case userLikes = "user_likes"
        
    }
}

struct RepostModel: Decodable {
    
    let count: Int
}


