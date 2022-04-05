//
//  UserModel.swift
//  VK_app
//
//  Created by Alex x on 3/25/22.
//

import Foundation

struct UserModel {
    let name: String
    let lastName: String
    let avatar: Int
    let photos: [PhotoModel]
    var groups: [GroupModel]
}
