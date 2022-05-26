//
//  RealmGroup.swift
//  VK_app
//
//  Created by Alex x on 5/23/22.
//

import Foundation
import RealmSwift

class RealmGroup: Object {
        
    @Persisted
    var id: Int
    
    @Persisted
    var isMember: Int
    
    @Persisted
    var name: String
    
    @Persisted
    var photo50: String
}

