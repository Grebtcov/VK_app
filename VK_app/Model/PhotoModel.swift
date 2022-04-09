//
//  PhotoModel.swift
//  VK_app
//
//  Created by Alex x on 3/25/22.
//

import Foundation

struct PhotoModel {
    let photo: String
    let name: String
    //Храним  ID пользователя который лайкнул фото
    var peopleClickedLike: [String] = []
    
    var countLike: Int {
        return peopleClickedLike.count
    }
}
