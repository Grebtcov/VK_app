//
//  RealmFriend.swift
//  VK_app
//
//  Created by Alex x on 5/23/22.
//

import Foundation
import RealmSwift

class RealmFriend: Object {
    
    @Persisted
    var id: Int
    
    @Persisted
    var photo50: String
    
    @Persisted
    var firstName: String
    
    @Persisted
    var lastName: String
}
