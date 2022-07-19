//
//  NewsModel.swift
//  VK_app
//
//  Created by Alex x on 4/12/22.
//

import Foundation
import SwiftUI

struct NewsConteiner: Decodable {
    let response: NewsModel
}

struct NewsModel: Decodable {
    
    let items: [ItemModel]
    let profiles: [FriendModel]
    let groups: [GroupModel]
    
    func getSource(id: Int) -> (name: String?, photo: String?) {
        var name: String?
        var photo: String?
        
        if id < 0 {
            let positiveId = id * -1
            let group = self.groups.first(where: {$0.id == positiveId})
            name = group?.name
            photo = group?.photo50
        } else {
            let profiles = self.profiles.first(where: {$0.id == id})
            name = profiles?.fullName
            photo = profiles?.photo50
        }
        return (name, photo)
    }
}

struct ItemModel: Decodable {
    let sourceId: Int
    let attachments: [AttachmentsModel]?
    let text: String
    let comments: NewsOtherItem
    let likes: NewsOtherItem
    let reposts: NewsOtherItem
    let views: NewsOtherItem
    var countCell: Int {
       (text == "" || attachments == nil) == true ? 3 : 4
    }
    
    enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case attachments
        case text
        case comments
        case likes
        case reposts
        case views
    }
}

struct AttachmentsModel: Decodable {
    let type: String
    let photo: PhotoModel?
}

struct NewsOtherItem: Decodable {
    let count: Int
}
