//
//  Session.swift
//  VK_app
//
//  Created by Alex x on 4/21/22.
//

import Foundation

struct Session {
    
    /// The shared singleton session object.
    static var shared = Session()
    
    var token: String = ""
    var userId: Int = 0
    
    private init() {}
}
