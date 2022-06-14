//
//  NewsModel.swift
//  VK_app
//
//  Created by Alex x on 4/12/22.
//

import Foundation

struct NewsConteiner: Decodable {
    
    let response: NewsModel
    
}

struct NewsModel: Decodable {
    
    var items: [NewsItem]
    let profiles: [FriendModel]
    let groups: [GroupModel]
    
}

struct NewsItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: NewsOtherItem?
    let likes: NewsOtherItem?
    let reposts: NewsOtherItem?
    let views: NewsOtherItem?
    
    enum CodingKeys: String, CodingKey {
        
        case sourceId = "source_id"
        case postId = "post_id"
        case text
        case date
        case comments
        case likes
        case reposts
        case views
    }
    
}

struct NewsOtherItem: Decodable {
    let count: Int
}
