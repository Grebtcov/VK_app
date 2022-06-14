//
//  RealmPhoto.swift
//  VK_app
//
//  Created by Alex x on 5/23/22.
//

import Foundation
import RealmSwift

class RealmPhoto: Object {
    
    @Persisted
    var idUser: Int
    
    @Persisted
    var text: String
    
    @Persisted
    var likesCount: Int
    
    @Persisted
    var userLikes: Int
    
    @Persisted
    var repostsCount: Int
    
    @Persisted
    var photo: String
    
    
}
