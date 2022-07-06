//
//  NewsModel.swift
//  VK_app
//
//  Created by Alex x on 4/12/22.
//

import Foundation

//Все что закомментированно нужно в следующей домашке

protocol ContentItemProtocol { }

protocol NewsProtocol {
    
}

struct NewsConteiner {
    
    let response: NewsModel
    
}

struct NewsModel {
    
    var items: [ContentItemProtocol]
   // let profiles: [FriendModel]
    let groups: GroupModel
    let footer: Footer
    
}

struct TextItem: ContentItemProtocol {
    
//    let sourceId: Int
//    let postId: Int
    let text: String
    //let date: Double
    
//
//    enum CodingKeys: String, CodingKey {
//
//        case sourceId = "source_id"
//        case postId = "post_id"
//        case text
//        case date
//        case comments
//        case likes
//        case reposts
//        case views
//    }
}

struct PhotoItem: ContentItemProtocol {
    let url: String
    //let date: Double
//    let comments: NewsOtherItem?
//    let likes: NewsOtherItem?
//    let reposts: NewsOtherItem?
//    let views: NewsOtherItem?
}

struct Footer {
    let comments: NewsOtherItem?
    let likes: NewsOtherItem?
    let reposts: NewsOtherItem?
    let views: NewsOtherItem?
}


struct NewsOtherItem: Decodable {
    let count: Int
}
