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
    let likes: LikeModel
    let reposts: RepostModel
    
   // Лишние поля пока решил скрыть пока по ДЗ нет необходимости
   //let albumId:
   // let date:
   // let id:
   // let ownerId:
   // let postId:
   // let hasTags:
    
    
//    enum CodingKeys: CodingKey {
//
//        case albumId = "album_id"
//        case date
//        case id
//        case ownerId = "owner_id"
//        case postId = "post_id"
//        case sizes
//        case text
//        case hasTags = "has_tags"
//        case likes
//        case reposts
//
//    }
    
    
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


